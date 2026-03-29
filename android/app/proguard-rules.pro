# Keep Flutter classes
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep Firebase / Crashlytics basics
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**
-dontwarn org.jetbrains.annotations.**