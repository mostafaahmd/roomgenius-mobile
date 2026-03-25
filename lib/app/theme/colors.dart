import 'package:flutter/material.dart';

class AppColors {
  // ============================================
  // MAIN BRAND COLORS - FROM YOUR DESIGN
  // These are the 4 core colors from your gradient
  // ============================================

  static const Color brandPink = Color(0xFFFF15FC); // #FF15FC - Pink/Magenta
  static const Color brandPurple = Color(0xFFBA68C8); // #B10AF4 - Purple
  static const Color brandBluePurple =
      Color(0xFF645CFD); // #645CFD - Blue-Purple
  static const Color brandBlue = Color(0xFF5AC7FF); // #5AC7FF - Blue/Cyan
  static const Color brandDarkBlue = Color(0xFF303F9F); // #303F9F - Dark Blue
  static const Color avatarBlue = Color(0xFF2E3A9D);
  // ============================================
  // PRIMARY COLOR = Use the purple as main
  // ============================================

  static const Color primary = Color(0xFFB10AF4); // #B10AF4 - Purple
  static const Color primaryDark = Color(0xFF9008D4);
  static const Color primaryLight = Color(0xFFC642F8);
  static const Color primaryVeryLight = Color(0xFFFAF0FF);
  static const Color primarySecondary = Color(0xFFBA68C8); // #BA68C8 - Purple

  // ============================================
  // SECONDARY COLOR = Use the blue
  // ============================================

  static const Color secondaryColor = Color(0xFF5AC7FF); // #5AC7FF - Blue
  static const Color secondaryDark = Color(0xFF3AAFEF);
  static const Color secondaryLight = Color(0xFF8ADBFF);
  static const Color secondaryVeryLight = Color(0xFFD5F2FF);

  // ============================================
  // ACCENT COLORS
  // ============================================

  static const Color accentPink = Color(0xFFFF15FC); // Pink
  static const Color accentBluePurple = Color(0xFF645CFD); // Blue-Purple

  // ============================================
  // SEMANTIC COLORS
  // ============================================

  static const Color successColor = Color(0xFF10B981);
  static const Color successHover = Color(0xFF059669);
  static const Color successLight = Color(0xFFD1FAE5);

  static const Color dangerColor = Color(0xFFEF4444);
  static const Color dangerHover = Color(0xFFDC2626);
  static const Color dangerLight = Color(0xFFFEE2E2);

  static const Color warningColor = Color(0xFFF59E0B);
  static const Color warningHover = Color(0xFFD97706);
  static const Color warningLight = Color(0xFFFEF3C7);

  static const Color infoColor = Color(0xFF3B82F6);
  static const Color infoHover = Color(0xFF2563EB);
  static const Color infoLight = Color(0xFFDBEAFE);

  // ============================================
  // NEUTRAL COLORS
  // ============================================

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);

  // Grays
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

  // ============================================
  // TEXT COLORS
  // ============================================

  static const Color textColor = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9CA3AF);

  // ============================================
  // BACKGROUND COLORS
  // ============================================

  static const Color scaffoldBackground = Color(0xFFFFFFFF);
  static const Color scaffoldWithBoxBackground = Color(0xFFF9FAFB);
  static const Color bkColor = Color(0xFFF3F4F6);
  static const Color slideMenuBackground = Color(0xF6F7F8FF);
  // Input field colors (from design)
  static const Color inputBackground =
      Color(0xFFF1F3FF); // Light blue background
  static const Color iconBackground =
      Color(0xFF6D6D6D); // Gray for prefix/suffix icons

  // ============================================
  // BORDER COLORS
  // ============================================

  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color borderColorDark = Color(0xFFD1D5DB);

  // ============================================
  // Banner COLORS
  // ============================================

  static const Color bannerShopBg = Color(0xFFFFD3EA);
  static const Color bannerShopCta = Color(0xFFE56CB6);

  static const Color bannerDiscoverBg = Color(0xFFBFEFFF);
  static const Color bannerDiscoverCta = Color(0xFF4BBDE3);

  static const Color bannerSendBg = Color(0xFFEFE7A8);
  static const Color bannerSendCta = Color(0xFFE1C300);

  static const Color receivedGiftCardBg =  primaryVeryLight;
  static const Color chipBg = Color(0xFFEFF3FF);
  static const Color chipText =
      Color(0xFF2E3A8C); // أو استخدمي brandDarkBlue عندك

  // ============================================
  // Blobs and floating shapes colors
  // ============================================

  static const Color blobWarm1 = Color(0xFFFFFFFF);
  static const Color blobWarm2 = Color(0xCCFFE8FF);
  static const Color blobWarm3 = Color(0xB0FF15FC);
  static const Color blobWarm4 = Color(0x668E6BFF);

  static const Color blobCool1 = Color(0xFFFFFFFF);
  static const Color blobCool2 = Color(0xCCF0F6FF);
  static const Color blobCool3 = Color(0x99645CFD);
  static const Color blobCool4 = Color(0x775AC7FF);
  
  // Stats Card Backgrounds
  static const Color statsBalanceBg = Color(0xFFFBF4FF); // Very light purple/pink
  static const Color statsHistoryBg = Color(0xFFFAF0FF); // Very light purple/pink
  static const Color statsPurplePill = Color(0xFFBA68C8); // For "View" buttons or badges
  static const Color statsTextMain = Color(0xFF000000);
  static const Color statsTextLabel = Color(0xFF6B7280);

  // Glow ellipse colors (behind hero)
  static const Color glowWhiteSoft = Color(0x35FFFFFF);
  static const Color glowPurpleSoft = Color(0x228E6BFF);
  static const Color glowShadow = Color(0x11000000);

  // Particles colors
  static const Color particleWhite = Color(0x66FFFFFF);
  static const Color particlePurpleSoft = Color(0x118E6BFF);

  // Transparent helper (instead of Colors.transparent)
  static const Color transparentColor = Color(0x00000000);

  // ============================================
  // Gift Card Reminder (Home)
  // ============================================

  static const Color giftCardReminderBg =
      primaryVeryLight; 
  static const Color giftCardReminderChipBg =
      primarySecondary;
  static const Color giftCardReminderDot = 
      primarySecondary;
  static const Gradient giftCardReminderCtaGradient =
      buttonGradient; 

  static const Color giftCardReminderLeftBg = Color(0xFFEFE9FF);

  // ============================================
  // LEGACY COLORS (for backward compatibility)
  // ============================================

  static const Color forgetPassTextColor = Color(0xFF637887);
  static const Color redColor = Color(0xFFBE1E2D);
  static const Color greyColor = Color.fromRGBO(91, 95, 121, 1);
  static const Color hintTextColor = Color(0xFF6B7882);
  static const Color textFieldBkColor = Color(0xFFF2F2F5);
  static const Color prefixIconColor = Color.fromRGBO(205, 205, 205, 1.0);
  static const Color errorRedColor = Color.fromRGBO(119, 20, 20, 1.0);
  static const Color accordionBGColor = Color(0xFFEDEFFF);
  static const Color cardColor = Color(0xFFF7F0E4);
  static const Color coloredBackground = Color(0xFFE4F8EA);
  static const Color placeholder = Color(0xFF8B8B97);
  static const Color textInputBackground = Color(0xFFF3F3F3);
  static const Color separator = Color(0xFFEAE9E9);
  static const Color gray = Color(0xFFE1E1E1);
  static const Color lightBlue = Color(0xFFF1F3FF);
  static const Color green = Color(0xFF4CAF50);
  // ============================================
  // GRADIENTS - USING YOUR 4 EXACT COLORS
  // ============================================

  /// Main button gradient - The signature gradient from your design
  /// Colors: Pink(#FF15FC) → Purple(#B10AF4) → Blue-Purple(#645CFD) → Blue(#5AC7FF)
  static const Gradient buttonGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xFFEC0BE9), // Pink
      Color(0xFFB10AF4), // Purple
      Color(0xFF645CFD), // Blue-Purple
      Color(0xFF47BDF9), // Blue
    ],
  );

  static const Gradient splashGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFFFF15FC), // Pink
      Color(0xFFB10AF4), // Purple
      Color(0xFF645CFD), // Blue-Purple
      Color(0xFF5AC7FF), // Blue
    ],
  );

  /// Main gradient for backgrounds
  static const Gradient mainGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFB10AF4), // Purple
      Color(0xFF5AC7FF), // Blue
    ],
  );

  static const Gradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFB10AF4), // Purple
      Color(0xFF5AC7FF), // Blue
    ],
  );

  /// Primary gradient - Purple dominant
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFB10AF4), // Purple
      Color(0xFF645CFD), // Blue-Purple
    ],
  );

  /// Secondary gradient - Blue dominant
  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF645CFD), // Blue-Purple
      Color(0xFF5AC7FF), // Blue
    ],
  );

  /// Success gradient
  static const Gradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF10B981),
      Color(0xFF34D399),
    ],
  );

  /// Danger gradient
  static const Gradient dangerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF15FC), // Pink
      Color(0xFFB10AF4), // Purple
    ],
  );

  /// Warning gradient
  static const Gradient warningGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFBBF24),
      Color(0xFFF59E0B),
    ],
  );

  /// Info gradient
  static const Gradient infoGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF3B82F6),
      Color(0xFF60A5FA),
    ],
  );

  /// Active pager dot gradient
  static const Gradient pagerDotActiveGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFB39DFF),
      Color(0xFFE0A6FF),
    ],
  );
}
