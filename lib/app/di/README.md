# Dependency Injection Rules

- Register app-wide services as lazy singletons.
- Register screen or flow state managers as factories unless global state is required.
- Repositories depend on data sources and services only.
- Repositories must not depend on Cubits, Blocs, BuildContext, or routers.
- Feature registration should live in dedicated `setup<Feature>Module()` functions.
