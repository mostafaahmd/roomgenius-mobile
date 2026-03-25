# Start Here

## Before building the first real feature
- review `docs/ARCHITECTURE.md`
- review `docs/FEATURE_WORKFLOW.md`
- review `analysis_options.yaml`
- review `lib/features/_feature_template`
- review the DI rules in `lib/core/di/README.md`

## First refactor recommended on a real project
Start with Auth as the reference feature.
It usually defines:
- route guards
- session restore
- secure storage usage
- logout flow
- analytics entry events

## Legacy feature notice
The existing auth feature is a legacy example from the original codebase.
When starting a real project, rebuild auth using `lib/features/_feature_template` as the reference structure.
