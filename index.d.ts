export interface DerivaStats {
  [key: string]: number;
}

export interface DerivaRunOptions {
  proof?: boolean;
  why?: boolean;
  explain?: boolean;
  maxDepth?: number;
  solutionLimit?: number;
  registry?: BuiltinRegistry;
  sourceMetadata?: boolean;
  markRecursive?: boolean;
  strictNegation?: boolean;
  analyzeNegation?: boolean;
  [key: string]: unknown;
}

export interface DerivaRunResult {
  stdout: string;
  stats: DerivaStats;
}

export interface DerivaSourcePart {
  text?: string;
  source?: string;
  filename?: string;
}

export interface DerivaClause {
  head: DerivaTerm;
  body: DerivaTerm[];
  index?: number;
  filename?: string;
  clauseNumber?: number;
}

export interface DerivaPredicateGroup {
  name: string;
  arity: number;
  clauses: DerivaClause[];
  argIndexes: unknown[];
  pairIndexes: unknown[];
  tabled: boolean;
  mode: string[] | null;
  determinism: 'det' | 'semidet' | null;
  recursive: boolean;
  tableInputPositions: number[];
  negationStratum: number | null;
}

export type DerivaTerm = Term | { type: string; name: string; args?: DerivaTerm[]; arity?: number };

export class Term {
  constructor(type: string, name?: unknown, args?: DerivaTerm[]);
  type: string;
  name: string;
  args: DerivaTerm[];
  get arity(): number;
}

export class Env {
  constructor(bindings?: Iterable<readonly [string, DerivaTerm]> | null);
  bindings: Map<string, DerivaTerm>;
  clone(): Env;
  has(name: string): boolean;
  get(name: string): DerivaTerm | undefined;
  bind(name: string, term: DerivaTerm): void;
}

export class Program {
  constructor(clauses?: DerivaClause[], options?: DerivaRunOptions);
  clauses: DerivaClause[];
  groups: Map<string, DerivaPredicateGroup>;
  materializedGroups: Set<string>;
  hasMaterialize: boolean;
  negationDependencies: Array<{ from: string; to: string; negative: boolean }>;
  negationStratificationErrors: Array<{ from: string; to: string }>;
  stratifiedNegation: boolean;
  static parse(source: string, options?: DerivaRunOptions): Program;
  static parseSources(sources?: Array<string | DerivaSourcePart>, options?: DerivaRunOptions): Program;
  makeGroup(name: string, arity: number): DerivaPredicateGroup;
  indexClause(clause: DerivaClause): void;
  findGroup(name: string, arity: number): DerivaPredicateGroup | null;
  applyDeclarations(options?: DerivaRunOptions): void;
  markRecursivePredicates(): void;
  analyzeNegationStratification(): Array<{ from: string; to: string }>;
  assertStratifiedNegation(): true;
  isStratifiedNegation(): boolean;
  hasMaterializeDeclarations(): boolean;
  groupIsMaterialized(group: DerivaPredicateGroup): boolean;
  groupHasRule(group: DerivaPredicateGroup): boolean;
  sourceFactLines(predicateKeys?: Set<string> | null): Set<string>;
  materializationGoals(): DerivaTerm[];
}

export interface BuiltinDefinition {
  name: string;
  arity: number;
  handler: BuiltinHandler;
  deterministic: boolean;
  ready: ((solver: Solver, goal: DerivaTerm, env: Env) => boolean) | null;
  fallbackWhenNotReady: boolean;
  shouldUse: ((solver: Solver, goal: DerivaTerm, env: Env) => boolean) | null;
}

export type BuiltinHandler = (context: { solver: Solver; goal: DerivaTerm; env: Env }) => Iterable<Env>;

export class BuiltinRegistry {
  constructor();
  defs: Map<string, BuiltinDefinition>;
  add(name: string, arity: number, handler: BuiltinHandler, options?: Partial<BuiltinDefinition>): this;
  get(name: string, arity: number): BuiltinDefinition | null;
}

export class Solver {
  constructor(program: Program, options?: DerivaRunOptions);
  program: Program;
  registry: BuiltinRegistry;
  maxDepth: number;
  solutionLimit: number;
  solutionsSeen: number;
  active: unknown[];
  memo: Map<string, unknown>;
  stats: DerivaStats;
  cloneForInnerGoal(solutionLimit?: number): Solver;
  solve(goals: DerivaTerm | DerivaTerm[], env?: Env, depth?: number): Iterable<Env>;
  activeVariant(goal: DerivaTerm, env: Env): boolean;
}

export const VAR: 'var';
export const ATOM: 'atom';
export const STRING: 'string';
export const NUMBER: 'number';
export const COMPOUND: 'compound';

export function variable(name: string): Term;
export function atom(name: string): Term;
export function stringTerm(value: string): Term;
export function numberTerm(value: string | number): Term;
/** Construct a compound term; an empty argument list is canonicalized to atom(name). */
export function compound(name: string, args?: DerivaTerm[]): Term;
export function emptyList(): Term;
export function cons(head: DerivaTerm, tail: DerivaTerm): Term;
export function deref(term: DerivaTerm, env: Env): DerivaTerm;
export function isScalar(term: DerivaTerm | null | undefined): boolean;
export function isEmptyList(term: DerivaTerm | null | undefined): boolean;
export function isCons(term: DerivaTerm | null | undefined): boolean;
export function isConjunction(term: DerivaTerm | null | undefined): boolean;
export function unify(left: DerivaTerm, right: DerivaTerm, env: Env): boolean;
export function cloneTerm(term: DerivaTerm): Term;
export function freshTerm(term: DerivaTerm, suffix: string | number): Term;
export function copyResolved(term: DerivaTerm, env: Env): Term;
export function termIsGround(term: DerivaTerm, env?: Env): boolean;
export function termToString(term: DerivaTerm, env?: Env, quoteStrings?: boolean): string;
export function lexicalValue(term: DerivaTerm, env: Env): string | null;
export function properListItems(list: DerivaTerm, env: Env): DerivaTerm[] | null;
export function listFromItems(items: DerivaTerm[], start?: number, end?: number, tail?: DerivaTerm): Term;
export function flattenConjunction(goal: DerivaTerm): DerivaTerm[];
export function termSignature(term: DerivaTerm | null | undefined): string | null;
export function variantTerms(left: DerivaTerm, leftEnv: Env, right: DerivaTerm, rightEnv: Env, pairs?: Map<string, string>, reverse?: Map<string, string>): boolean;
export function compareTerms(left: DerivaTerm, right: DerivaTerm): number;
export function isDecimalInteger(text: string | null | undefined): boolean;
export function compareIntegerText(left: string, right: string): number;
export function parseFiniteNumber(text: string | null | undefined): number | null;
export function numberTextFromDouble(value: number): string | null;
export function compareNumberText(left: string, right: string): number;

export function makeProgram(source: string, options?: DerivaRunOptions): Program;
export function parseClauses(source: string, options?: DerivaRunOptions): DerivaClause[];
export function parseProgramText(source: string, options?: DerivaRunOptions): DerivaClause[];
export function createDefaultRegistry(): BuiltinRegistry;
export function getDefaultRegistry(): BuiltinRegistry;
export function run(source: string | Program, options?: DerivaRunOptions): DerivaRunResult;
export function whyProof(program: Program, goal: DerivaTerm, options?: DerivaRunOptions): { ok: boolean; text: string };
export function whyNoProof(goal: DerivaTerm): string;
export function explainProof(program: Program, goal: DerivaTerm, options?: DerivaRunOptions): { ok: boolean; text: string };

declare const deriva: {
  VAR: typeof VAR;
  ATOM: typeof ATOM;
  STRING: typeof STRING;
  NUMBER: typeof NUMBER;
  COMPOUND: typeof COMPOUND;
  Term: typeof Term;
  Env: typeof Env;
  Program: typeof Program;
  Solver: typeof Solver;
  BuiltinRegistry: typeof BuiltinRegistry;
  variable: typeof variable;
  atom: typeof atom;
  stringTerm: typeof stringTerm;
  numberTerm: typeof numberTerm;
  compound: typeof compound;
  emptyList: typeof emptyList;
  cons: typeof cons;
  deref: typeof deref;
  isScalar: typeof isScalar;
  isEmptyList: typeof isEmptyList;
  isCons: typeof isCons;
  isConjunction: typeof isConjunction;
  unify: typeof unify;
  cloneTerm: typeof cloneTerm;
  freshTerm: typeof freshTerm;
  copyResolved: typeof copyResolved;
  termIsGround: typeof termIsGround;
  termToString: typeof termToString;
  lexicalValue: typeof lexicalValue;
  properListItems: typeof properListItems;
  listFromItems: typeof listFromItems;
  flattenConjunction: typeof flattenConjunction;
  termSignature: typeof termSignature;
  variantTerms: typeof variantTerms;
  compareTerms: typeof compareTerms;
  isDecimalInteger: typeof isDecimalInteger;
  compareIntegerText: typeof compareIntegerText;
  parseFiniteNumber: typeof parseFiniteNumber;
  numberTextFromDouble: typeof numberTextFromDouble;
  compareNumberText: typeof compareNumberText;
  makeProgram: typeof makeProgram;
  parseClauses: typeof parseClauses;
  parseProgramText: typeof parseProgramText;
  createDefaultRegistry: typeof createDefaultRegistry;
  getDefaultRegistry: typeof getDefaultRegistry;
  run: typeof run;
  whyProof: typeof whyProof;
  whyNoProof: typeof whyNoProof;
  explainProof: typeof explainProof;
};

export default deriva;
