import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // =========================================================
  // BRAND COLORS - ROOMGENIUS
  // =========================================================

  /// Main primary purple used across buttons, highlights, and actions.
  static const Color primary = Color(0xFF7A3CFF);

  /// Darker purple for pressed / stronger emphasis states.
  static const Color primaryDark = Color(0xFF6F2CFF);

  /// Lighter purple used in splash and soft accents.
  static const Color primaryLight = Color(0xFFB78CFF);

  /// Very soft purple surface tint.
  static const Color primarySoft = Color(0xFFF3ECFF);

  /// Secondary supporting blue-purple.
  static const Color secondary = Color(0xFF645CFD);

  /// Optional cyan accent if needed later in charts / AI states / highlights.
  static const Color accent = Color(0xFF5AC7FF);

  // =========================================================
  // NEUTRALS
  // =========================================================

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray = Color(0xFFD1D5DB);
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);

  // =========================================================
  // TEXT COLORS
  // =========================================================
  static const Color textColor = Color(0xFF1F2937);
  static const Color hintTextColor = Color(0xFF9CA3AF);
  static const Color textPrimary = gray900;
  static const Color textSecondary = gray500;
  static const Color textMuted = gray400;
  static const Color textOnPrimary = white;
  static const Color textOnDark = white;

  // =========================================================
  // SURFACES / BACKGROUNDS
  // =========================================================

  static const Color background = Color(0xFFF7F7FA);
  static const Color scaffoldBackground = background;
  static const Color surface = Color.fromARGB(255, 242, 230, 249);
  static const Color surfaceSoft = Color(0xFFFAFAFC);
  static const Color inputBackground = Color(0xFFF3F4F8);

  // =========================================================
  // BORDERS / DIVIDERS
  // =========================================================

  static const Color border = gray200;
  static const Color borderStrong = gray300;
  static const Color divider = Color(0xFFEAECEF);

  // =========================================================
  // SEMANTIC COLORS
  // =========================================================

  static const Color success = Color(0xFF10B981);
  static const Color successSoft = Color(0xFFD1FAE5);

  static const Color warning = Color(0xFFF59E0B);
  static const Color warningSoft = Color(0xFFFEF3C7);

  static const Color error = Color(0xFFEF4444);
  static const Color errorSoft = Color(0xFFFEE2E2);

  static const Color info = Color(0xFF3B82F6);
  static const Color infoSoft = Color(0xFFDBEAFE);

  // =========================================================
  // SPECIAL UI TOKENS
  // =========================================================

  static const Color overlayLight = Color(0x1FFFFFFF);
  static const Color overlayDark = Color(0x33000000);
  static const Color shadow = Color(0x14000000);
  static const Color transparent = Color(0x00000000);

  // =========================================================
  // SPLASH / ONBOARDING SPECIFIC TOKENS
  // =========================================================

  static const Color splashTop = primaryLight;
  static const Color splashBottom = primaryDark;

  static const Color onboardingProgressActive = primary;
  static const Color onboardingProgressInactive = gray300;

  // =========================================================
  // GRADIENTS
  // =========================================================

  static const LinearGradient primaryButtonGradient = LinearGradient(
    colors: [
      primary,
      primaryDark,
    ],
  );

  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      splashTop,
      splashBottom,
    ],
  );

  static const LinearGradient primarySurfaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primarySoft,
      white,
    ],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      secondary,
      accent,
    ],
  );
}
  