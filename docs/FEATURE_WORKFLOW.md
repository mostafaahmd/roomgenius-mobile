# New Feature Workflow

1. Run `./tools/create_feature.sh feature_name` or copy `lib/features/_feature_template` manually
2. Rename `_feature_template` to the feature name
3. Rename placeholder files and classes
4. Register dependencies in the feature module
5. Add route entry if the feature has pages
6. Add localization keys if the feature has UI strings
7. Add unit tests for the repository/use case/cubit
8. Add widget tests for critical screens

## Minimum Definition of Done
A feature is not done until it has:
- clean folder structure
- no direct Dio usage in UI
- one clear entry point page
- failure handling
- loading / success / failure states
- localization keys
- at least basic tests for real features

## Scaffold output
The feature script also creates test stubs under:
- `test/unit/features/<feature_name>/`
- `test/widget/features/<feature_name>/`
