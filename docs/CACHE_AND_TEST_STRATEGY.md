# Cache and Test Strategy

## Cache
This template intentionally does not force a single offline engine.
The project using the template can choose Hive, Isar, Drift, or another store.

What the template guarantees:
- local data source slot exists
- storage services exist
- cache policy types exist
- `CacheManager` abstraction exists for lightweight key-value caching
- repositories can add cache logic without breaking the architecture

## Tests
This template intentionally does not ship with fake feature tests.
What it guarantees instead:
- `test/unit`
- `test/widget`
- `integration_test`
- code is shaped to allow tests to be added per real feature
- `tools/create_feature.sh` generates basic repository/cubit/widget test stubs
