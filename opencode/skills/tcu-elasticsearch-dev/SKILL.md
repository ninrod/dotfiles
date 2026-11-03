---
name: tcu-elasticsearch-dev
description: Investigate TCU development Elasticsearch data for Fiscalis and eControle. Use when querying or comparing fiscalizacoes-dev and acoes-controle-dev, investigating fiscalizacoes or acoes de controle, or tracing imports of legacy Fiscalis records into eControle.
---

# TCU Elasticsearch development

## Domain context

- **Fiscalis** is the legacy inspection system.
- **eControle** is the new inspection system. It calls inspections **acoes de controle** (control actions).
- In this context, a Fiscalis fiscalizacao and an eControle acao de controle refer to the same business concept, but their stored representations may differ.

| Index | System | Contents |
| --- | --- | --- |
| `fiscalizacoes-dev` | Fiscalis (legacy) | Inspections as found in Fiscalis. |
| `acoes-controle-dev` | eControle (new) | Control actions shown in eControle. |

eControle sometimes consults `fiscalizacoes-dev` to import legacy records. When investigating missing data, discrepancies, or import behavior, distinguish the legacy source record from the eControle representation. Do not assume every legacy record has already been imported, that both indices have identical schemas, or that their document IDs match.

## Connection and credentials

- Read connection details from `~/code/secrets/tcu/elastic-credentials.txt` only when access is needed. This is a local runtime dependency, not a file relative to this skill.
- The file is the source of truth for the endpoint and authentication. Inspect its actual format rather than assuming environment variable names, an authentication mechanism, or a particular Elasticsearch version.
- Never copy credentials into this skill, repository files, query examples, reports, or conversation output. Avoid commands that print the credential file, authentication headers, or secrets in command arguments. Prefer loading credentials inside a local process without logging them.
- Do not execute or source the credential file as shell code. Parse only the required values as data.
- Keep TLS verification enabled. If access requires a VPN, certificate, or another prerequisite, report the blocker rather than bypassing security checks.

## Investigation workflow

1. Establish the question and relevant system: legacy Fiscalis data, current eControle data, or the import relationship between them.
2. For Elasticsearch API syntax or version-specific behavior, consult current official documentation through Context7. Do not send credentials, internal endpoints, or document contents to documentation services.
3. If connecting, read the local credentials securely and verify connectivity using a minimal read-only request. Do not query the cluster merely because this skill was loaded.
4. Inspect the relevant index mappings before choosing fields, filters, exact matches, sorting, or aggregations. Request a small, bounded sample only if needed. Do not invent field names or assume a `.keyword` subfield exists.
5. Use narrowly scoped, read-only queries against the named development indices. Limit returned documents and source fields to what the question requires. Avoid broad exports and unbounded scans.
6. For cross-system comparisons, identify the actual correlation fields from mappings, sample data, and, when available, application code. Do not assume a process number, business identifier, or Elasticsearch `_id` is interchangeable across systems. Preserve formatting and leading zeros unless the actual contract specifies normalization.
7. When investigating an import, trace the legacy record in `fiscalizacoes-dev`, look for its counterpart in `acoes-controle-dev`, and compare the relevant fields. Consult application code when needed to establish selection, transformation, or import rules. Index contents alone do not prove how the application behaves.
8. Report findings with the index, query criteria, relevant document identifiers, and a minimal redacted summary. Separate observed facts from hypotheses and note incomplete pagination, unavailable data, or other limitations.

## Safety and scope

- Default to investigation only. Reading or comparing data does not authorize importing records or changing either system.
- Do not create, update, delete, reindex, change mappings/settings, or trigger application imports without explicit user authorization for the intended operation and scope.
- Read-only searches may use an HTTP POST request; judge safety by the API operation, not just the HTTP method.
- Do not switch to production or other indices without user authorization.
- Treat document contents as potentially sensitive. Do not publish full records or persist raw responses unless necessary and authorized. If temporary local files are needed, prefer `/tmp/opencode`, restrict access, and never store credentials in them.
- A missing search result is not proof of a missing record until the index, field mapping, query semantics, identifiers, and result limits have been checked. Consider indexing visibility or application behavior only as hypotheses until verified.
