// Lossless RDF 1.2 <-> ordinary Eyepl term encoding.
import { Parser } from 'n3';
export const XSD_STRING = 'http://www.w3.org/2001/XMLSchema#string';
export const RDF_LANG_STRING = 'http://www.w3.org/1999/02/22-rdf-syntax-ns#langString';
export const RDF_DIR_LANG_STRING = 'http://www.w3.org/1999/02/22-rdf-syntax-ns#dirLangString';

export function parseNQuads(source, { scope = 'input' } = {}) {
  return new Parser({ format: 'application/n-quads', blankNodePrefix: '' })
    .parse(stripVersionDirective(source))
    .map((quad) => fromRdfJsQuad(quad, scope));
}

function stripVersionDirective(source) {
  return String(source ?? '').replace(/^([ \t]*)VERSION[ \t]+"1\.2"[ \t]*(?:#.*)?$/m, '$1');
}

export function fromRdfJsQuad(quad, scope = 'input') {
  return {
    subject: fromRdfJs(quad.subject, scope),
    predicate: fromRdfJs(quad.predicate, scope),
    object: fromRdfJs(quad.object, scope),
    graph: fromRdfJs(quad.graph, scope),
  };
}

export function fromRdfJs(term, scope = 'input') {
  if (term.termType === 'NamedNode') return { kind: 'namedNode', value: term.value };
  if (term.termType === 'BlankNode') return { kind: 'blankNode', scope, value: term.value };
  if (term.termType === 'DefaultGraph') return { kind: 'defaultGraph' };
  if (term.termType === 'Literal') return { kind: 'literal', value: term.value, language: term.language, direction: term.direction ?? '', datatype: term.datatype.value };
  if (term.termType === 'Quad') return { kind: 'triple', subject: fromRdfJs(term.subject, scope), predicate: fromRdfJs(term.predicate, scope), object: fromRdfJs(term.object, scope) };
  throw new Error(`unsupported RDF/JS term type: ${term.termType}`);
}

export function quadToEyepl(q, predicate = 'rdf') {
  return `${predicate}(${toEyepl(q.subject)}, ${toEyepl(q.predicate)}, ${toEyepl(q.object)}, ${toEyepl(q.graph)}).`;
}

export function toEyepl(t) {
  if (t.kind === 'namedNode') return `iri(${quote(t.value)})`;
  if (t.kind === 'blankNode') return `bnode(${quote(t.scope)}, ${quote(t.value)})`;
  if (t.kind === 'defaultGraph') return 'default_graph';
  if (t.kind === 'triple') return `triple(${toEyepl(t.subject)}, ${toEyepl(t.predicate)}, ${toEyepl(t.object)})`;
  if (t.kind === 'literal') {
    const annotation = t.language
      ? (t.direction ? `lang(${quote(t.language)}, ${t.direction})` : `lang(${quote(t.language)})`)
      : `datatype(${quote(t.datatype ?? XSD_STRING)})`;
    return `literal(${quote(t.value)}, ${annotation})`;
  }
  throw new Error(`unsupported RDF term kind: ${t?.kind ?? typeof t}`);
}

export function eyeplQuadToNQuad(term) {
  if (term?.type !== 'compound' || term.name !== 'rdf' || term.args.length !== 4) throw new Error('expected rdf/4 fact');
  const [subject, predicate, object, graph] = term.args.map(fromEyepl);
  assertTriple(subject, predicate, object);
  if (!['namedNode', 'blankNode', 'defaultGraph'].includes(graph.kind)) throw new Error('invalid RDF graph');
  return `${toNQ(subject)} ${toNQ(predicate)} ${toNQ(object)}${graph.kind === 'defaultGraph' ? '' : ` ${toNQ(graph)}`} .`;
}

export function fromEyepl(t) {
  if (t?.type === 'atom' && t.name === 'default_graph') return { kind: 'defaultGraph' };
  if (compound(t, 'iri', 1)) return { kind: 'namedNode', value: scalar(t.args[0], 'IRI') };
  if (compound(t, 'bnode', 2)) return { kind: 'blankNode', scope: scalar(t.args[0], 'blank-node scope'), value: scalar(t.args[1], 'blank-node label') };
  if (compound(t, 'triple', 3)) {
    const [subject, predicate, object] = t.args.map(fromEyepl);
    assertTriple(subject, predicate, object);
    return { kind: 'triple', subject, predicate, object };
  }
  if (compound(t, 'literal', 2)) {
    const value = scalar(t.args[0], 'literal');
    if (compound(t.args[1], 'lang', 1)) return { kind: 'literal', value, language: scalar(t.args[1].args[0], 'language').toLowerCase(), direction: '', datatype: RDF_LANG_STRING };
    if (compound(t.args[1], 'lang', 2)) {
      const direction = scalar(t.args[1].args[1], 'base direction').toLowerCase();
      if (direction !== 'ltr' && direction !== 'rtl') throw new Error('base direction must be ltr or rtl');
      return { kind: 'literal', value, language: scalar(t.args[1].args[0], 'language').toLowerCase(), direction, datatype: RDF_DIR_LANG_STRING };
    }
    if (compound(t.args[1], 'datatype', 1)) return { kind: 'literal', value, language: '', datatype: scalar(t.args[1].args[0], 'datatype') };
    throw new Error('literal annotation must be lang/1, lang/2, or datatype/1');
  }
  throw new Error(`term is not an RDF value: ${t?.name ?? typeof t}`);
}

function toNQ(t) {
  if (t.kind === 'namedNode') return `<${escapeIri(t.value)}>`;
  if (t.kind === 'blankNode') return `_:e${hex(t.scope)}_${hex(t.value)}`;
  if (t.kind === 'triple') return `<<( ${toNQ(t.subject)} ${toNQ(t.predicate)} ${toNQ(t.object)} )>>`;
  if (t.kind === 'literal') {
    const q = `"${String(t.value).replace(/\\/g, '\\\\').replace(/"/g, '\\"').replace(/\r/g, '\\r').replace(/\n/g, '\\n')}"`;
    if (t.language) return `${q}@${t.language}${t.direction ? `--${t.direction}` : ''}`;
    return (t.datatype ?? XSD_STRING) === XSD_STRING ? q : `${q}^^<${escapeIri(t.datatype)}>`;
  }
  throw new Error(`cannot serialize ${t.kind}`);
}
function quote(v) { return `"${String(v).replace(/\\/g, '\\\\').replace(/"/g, '\\"').replace(/\n/g, '\\n').replace(/\t/g, '\\t')}"`; }
function escapeIri(v) { return String(v).replace(/[<>"{}|^`\\\u0000-\u0020]/g, (c) => `\\u${c.charCodeAt(0).toString(16).padStart(4, '0')}`); }
function hex(v) { return Buffer.from(String(v), 'utf8').toString('hex'); }
function compound(t, name, arity) { return t?.type === 'compound' && t.name === name && t.args.length === arity; }
function scalar(t, label) { if (!t || !['atom', 'string', 'number'].includes(t.type)) throw new Error(`${label} must be a scalar`); return t.name; }
function assertTriple(subject, predicate, object) {
  if (!['namedNode', 'blankNode'].includes(subject.kind)) throw new Error('RDF subject must be an IRI or blank node');
  if (predicate.kind !== 'namedNode') throw new Error('RDF predicate must be an IRI');
  if (!['namedNode', 'blankNode', 'literal', 'triple'].includes(object.kind)) throw new Error('invalid RDF object');
}
