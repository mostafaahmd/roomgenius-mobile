# Starter Template Architecture

## Objective
This template is meant to be a reusable base for new Flutter apps.
It is not a finished product app and should not be judged by placeholder feature behavior.

## Dependency Direction
Only this dependency direction is allowed:

presentation -> domain -> data -> core

Forbidden:
- repository -> cubit
- interceptor -> UI
- data source -> router
- core -> feature imports
- feature A -> feature B implementation imports

## Core Foundation
The template must always provide:
- app bootstrap
- dependency injection
- routing
- error / failure / result system
- storage abstractions
- session handling foundation
- monitoring / analytics services
- theme and localization base

## Feature Module Shape
Each new feature must follow:
- domain/entities
- domain/repositories
- domain/usecases
- data/datasources/remote
- data/datasources/local
- data/dto
- data/mappers
- data/repositories
- presentation/cubit
- presentation/pages
- presentation/widgets
- di/feature_module.dart

## State Management Policy
- Use Cubit by default.
- Use Bloc only for event-heavy or multi-source flows.
- Register screen-level state managers as factories.
- Register app-wide services as lazy singletons.

## Cache Policy
Offline/cache implementation is optional per project.
What is mandatory in the template is the architectural slot for it:
- `core/cache`
- `data/datasources/local`
- storage abstractions in `core/storage`

## Testing Policy
The template should be testable before tests are written.
Mandatory requirements:
- constructor injection
- repository contracts or clear boundaries
- no Dio inside presentation
- no BuildContext in repositories
- `test/` and `integration_test/` folders available
- local data sources deal with DTOs or cache models, not domain entities
