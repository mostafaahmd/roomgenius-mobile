# Production Professional Starter Template Upgrade

## Scope of this template
This template is evaluated as a reusable base, not as a completed product app.
Placeholder features may be replaced or deleted.
The important part is the structure, boundaries, foundation, and reusability.

## What changed

### 1) Unified bootstrap
- Added `lib/app/bootstrap/bootstrap.dart`
- Development and production mains now share one startup flow
- Crashlytics, analytics, service locator, notifications, bloc observer, and UI setup are initialized in one place

### 2) Central error handling foundation
Added:
- `lib/core/error/app_exception.dart`
- `lib/core/error/failure.dart`
- `lib/core/error/result.dart`
- `lib/core/error/error_mapper.dart`

### 3) Networking cleanup
- `CustomDioInterceptors` no longer shows toasts or dialogs
- `CustomDioInterceptors` no longer logs the user out directly
- 401 on protected routes now emits a session-expiry event only

### 4) Session handling foundation
Added:
- `lib/core/auth/session_service.dart`
- `lib/core/auth/session_expiry_notifier.dart`
- `lib/core/auth/session_expiry_listener.dart`

### 5) Storage and cache slots
Added:
- `lib/core/storage/local_storage_service.dart`
- `lib/core/storage/secure_storage_service.dart`
- `lib/core/cache/cache_policy.dart`
- `lib/core/cache/cache_manager.dart`

This gives the template a place for cache and offline support without forcing a database choice too early.

### 6) Router guard extraction
Added:
- `lib/core/routing/app_route_guards.dart`
- `lib/core/routing/route_guard.dart`

The router can now delegate auth redirect logic instead of keeping it inline.

### 7) Presentation base state
Added:
- `lib/core/presentation/view_state.dart`

This is a reusable default shape for loading, success, and failure UI state.

### 8) Feature scaffold template
Added:
- `lib/features/_feature_template/`
- `tools/create_feature.sh`

This is now the recommended source for creating every new feature.

### 9) Test structure foundation
Added:
- `test/`
- `integration_test/`

The template is now explicitly test-ready even if placeholder features do not yet include tests.

### 10) Quality gates added
- `analysis_options.yaml`
- `.github/workflows/flutter_ci.yml`
- architecture and workflow docs under `docs/`

## What this template intentionally does not force
- a specific local database engine
- fake tests for placeholder features
- keeping existing sample features as-is

## Next step on a real project
Start by rebuilding Auth or any first real feature using `lib/features/_feature_template` as the source of truth.
