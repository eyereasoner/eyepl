import { Readable } from 'node:stream';
import { rdfParser } from 'rdf-parse';
import { fromRdfJsQuad } from './rdf-codec.mjs';

const CONTENT_TYPES = {
  html: 'text/html', json: 'application/ld+json', jsonld: 'application/ld+json',
  n3: 'text/n3', nq: 'application/n-quads', nquads: 'application/n-quads',
  nt: 'application/n-triples', ntriples: 'application/n-triples', owl: 'application/rdf+xml',
  rdf: 'application/rdf+xml', rdfxml: 'application/rdf+xml', shaclc: 'text/shaclc',
  shc: 'text/shaclc', svg: 'image/svg+xml', trig: 'application/trig',
  ttl: 'text/turtle', turtle: 'text/turtle', xhtml: 'application/xhtml+xml', xml: 'application/xml',
};

export async function parseRdf(source, { path, contentType, baseIRI, scope = 'input' } = {}) {
  const type = normalizeContentType(contentType);
  if (!path && !type) throw new Error('RDF from standard input requires --format');
  const document = String(source ?? '').replace(/^([ \t]*)VERSION[ \t]+"1\.2"[ \t]*(?:#.*)?$/m, '$1');
  const stream = rdfParser.parse(Readable.from([document]), {
    ...(path ? { path } : {}), ...(type ? { contentType: type } : {}), ...(baseIRI ? { baseIRI } : {}),
  });
  const quads = [];
  for await (const quad of stream) quads.push(fromRdfJsQuad(quad, scope));
  return quads;
}

export function normalizeContentType(format) {
  if (!format) return undefined;
  const value = String(format).toLowerCase().replace(/^\./, '');
  return CONTENT_TYPES[value] ?? (value.includes('/') ? value : undefined);
}
