# Feature Template

Duplicate this folder when creating a new feature.

Rules:
- Keep feature code self-contained.
- Put API models in `data/dto`.
- Put mappers in `data/mappers`.
- Put remote and local data access behind data sources.
- Keep `presentation` free from Dio and DTO types.
- Register the feature in `di/feature_module.dart`.

- Local data sources store DTOs/cache models, then repositories map them to entities.
