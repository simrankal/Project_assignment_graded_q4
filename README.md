# CodeJudge Data Integrity Audit and Repair

## Objective

This project audits the imported CodeJudge database for:

* primary key violations
* foreign key violations
* duplicate records
* invalid domain values
* inconsistent timestamps
* missing mandatory values

The project also demonstrates safe repair workflows using staging tables.

## Files

| File                       | Purpose                             |
| -------------------------- | ----------------------------------- |
| import_validation.sql      | Import and row-count checks         |
| integrity_audit.sql        | PK/FK/relationship audits           |
| domain_rule_checks.sql     | Domain and business-rule validation |
| repair_plan.md             | Repair decisions and reasoning      |
| staging_repair_scripts.sql | Safe repair operations              |
| before_after_evidence.md   | Evidence of repairs                 |

## Repair Strategy

Original imported tables are never modified directly.

Repairs are performed only on:

* staging tables
* copied audit tables

This ensures:

* rollback safety
* audit traceability
* reproducibility
