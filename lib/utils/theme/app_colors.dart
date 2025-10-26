import 'package:flutter/material.dart';

/// Vibrant Plant-themed color palette
/// Bright, energetic colors inspired by lush tropical plants
class AppColors {
  // ============================================================================
  // PRIMARY COLORS - Vibrant Green (Main plant theme)
  // ============================================================================
  static const primary = Color(0xFF00C853); // Vibrant emerald green
  static const primaryDark = Color(0xFF00A344); // Rich green
  static const primaryLight = Color(0xFF5FFF8E); // Bright mint green
  static const primaryPale = Color(0xFFE0FFF0); // Very light mint

  // ============================================================================
  // SECONDARY COLORS - Fresh Lime
  // ============================================================================
  static const secondary = Color(0xFF76FF03); // Electric lime
  static const secondaryDark = Color(0xFF64DD17); // Vibrant lime
  static const secondaryLight = Color(0xFFCCFF90); // Light lime
  static const secondaryPale = Color(0xFFF1F8E9); // Pale lime

  // ============================================================================
  // BACKGROUND COLORS - Dark but Rich
  // ============================================================================
  static const background = Color(0xFF0D1B0D); // Deep forest black
  static const secondBackground = Color(0xFF1A2E1A); // Rich dark green
  static const surface = Color(0xFF152515); // Natural surface
  static const surfaceLight = Color(0xFF1F331F); // Lighter surface

  // ============================================================================
  // TEXT COLORS
  // ============================================================================
  static const textPrimary = Color(0xFFFFFFFF); // Pure white
  static const textSecondary = Color(0xFFE0FFE0); // Light mint
  static const textTertiary = Color(0xFFA8F5A8); // Bright sage
  static const textDisabled = Color(0xFF5A7D5A); // Muted sage
  static const textOnPrimary = Color(0xFFFFFFFF); // White on green
  static const textOnSecondary = Color(0xFF0D1B0D); // Dark on lime

  // ============================================================================
  // ACCENT COLORS - Vibrant Botanical Elements
  // ============================================================================

  // Fresh Growth
  static const accentMint = Color(0xFF00FFB3); // Electric mint
  static const accentEmerald = Color(0xFF10E06C); // Bright emerald
  static const accentJade = Color(0xFF00FFA3); // Brilliant jade

  // Flowers & Blooms
  static const accentBloom = Color(0xFFFF5EC7); // Hot pink blossom
  static const accentLavender = Color(0xFFB084FF); // Bright lavender
  static const accentPeach = Color(0xFFFFAA5A); // Vibrant peach
  static const accentRose = Color(0xFFFF6B9D); // Rose flower

  // Sunlight & Energy
  static const accentSunlight = Color(0xFFFFD740); // Bright sunlight
  static const accentGolden = Color(0xFFFFEB3B); // Golden glow
  static const accentAmber = Color(0xFFFFCA28); // Warm amber

  // Water & Sky
  static const accentWater = Color(0xFF18FFFF); // Crystal water
  static const accentSky = Color(0xFF40C4FF); // Bright sky
  static const accentAqua = Color(0xFF64FFDA); // Aqua fresh

  // ============================================================================
  // SEMANTIC COLORS - Bright & Clear
  // ============================================================================

  // Success - Healthy Plant
  static const success = Color(0xFF00E676); // Bright success green
  static const successLight = Color(0xFF69F0AE); // Light success
  static const successPale = Color(0xFFB9F6CA); // Pale success

  // Warning - Needs Attention
  static const warning = Color(0xFFFFAB00); // Bright orange
  static const warningLight = Color(0xFFFFD740); // Light orange
  static const warningPale = Color(0xFFFFE57F); // Pale orange

  // Error - Plant Problem
  static const error = Color(0xFFFF1744); // Bright red
  static const errorLight = Color(0xFFFF5252); // Light red
  static const errorPale = Color(0xFFFF8A80); // Pale red

  // Info - Tips & Advice
  static const info = Color(0xFF00B0FF); // Bright blue
  static const infoLight = Color(0xFF40C4FF); // Light blue
  static const infoPale = Color(0xFF80D8FF); // Pale blue

  // ============================================================================
  // PLANT HEALTH STATUS COLORS - Vibrant Indicators
  // ============================================================================

  // Plant Health Indicators
  static const plantThriving = Color(0xFF00E676); // Thriving - electric green
  static const plantHealthy = Color(0xFF00C853); // Healthy - vibrant green
  static const plantGood = Color(0xFF76FF03); // Good - lime green
  static const plantOkay = Color(0xFFFFEB3B); // Okay - bright yellow
  static const plantAttention = Color(0xFFFF9100); // Needs attention - orange
  static const plantPoor = Color(0xFFFF6D00); // Poor - bright orange-red
  static const plantCritical = Color(0xFFFF1744); // Critical - bright red

  // Care Indicators
  static const needsWater = Color(0xFF00B0FF); // Bright blue for water
  static const needsSunlight = Color(0xFFFFAB00); // Bright orange for sun
  static const needsFertilizer = Color(0xFFA1887F); // Light brown for soil
  static const needsPruning = Color(0xFFAB47BC); // Bright purple for pruning
  static const needsRepotting = Color(0xFFEC407A); // Bright pink for repotting

  // ============================================================================
  // SEASONAL COLORS - Vibrant Seasons
  // ============================================================================
  static const spring = Color(0xFF69F0AE); // Bright spring green
  static const summer = Color(0xFFFFEB3B); // Sunny yellow
  static const autumn = Color(0xFFFF7043); // Warm orange
  static const winter = Color(0xFF40C4FF); // Cool bright blue

  // ============================================================================
  // BORDER & DIVIDER
  // ============================================================================
  static const border = Color(0xFF2E4A2E); // Visible border
  static const borderLight = Color(0xFF3D5C3D); // Lighter border
  static final divider = const Color(0xFF00C853).withOpacity(0.15); // Green tint
  static final dividerLight = const Color(0xFF00C853).withOpacity(0.25); // Visible green

  // ============================================================================
  // SHADOW & OVERLAY
  // ============================================================================
  static final shadow = Colors.black.withOpacity(0.4); // Deeper shadow
  static final shadowMedium = Colors.black.withOpacity(0.5); // Medium shadow
  static final shadowDark = Colors.black.withOpacity(0.7); // Dark shadow
  static final overlay = Colors.black.withOpacity(0.6); // Modal overlay
  static final overlayLight = Colors.black.withOpacity(0.4); // Light overlay
  static final shimmer = const Color(0xFF00C853).withOpacity(0.15); // Green shimmer

  // ============================================================================
  // GRADIENTS - Vibrant & Energetic
  // ============================================================================

  // Primary gradient - Electric forest
  static const gradientPrimary = LinearGradient(
    colors: [Color(0xFF00C853), Color(0xFF00E676)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Success gradient - Thriving growth
  static const gradientSuccess = LinearGradient(
    colors: [Color(0xFF00E676), Color(0xFF69F0AE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Sunlight gradient - Warm energy
  static const gradientSunlight = LinearGradient(
    colors: [Color(0xFFFFD740), Color(0xFFFFAB00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Water gradient - Crystal fresh
  static const gradientWater = LinearGradient(
    colors: [Color(0xFF18FFFF), Color(0xFF00B0FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Background gradient - Rich depth
  static const gradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [background, secondBackground, background],
    stops: [0.0, 0.5, 1.0],
  );

  // Card gradient - Vibrant surface
  static const gradientCard = LinearGradient(
    colors: [surface, surfaceLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Tropical gradient - Lush paradise
  static const gradientTropical = LinearGradient(
    colors: [Color(0xFF00C853), Color(0xFF76FF03)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Bloom gradient - Flower power
  static const gradientBloom = LinearGradient(
    colors: [Color(0xFFFF5EC7), Color(0xFFB084FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shimmer gradient - Animated glow
  static const gradientShimmer = LinearGradient(
    begin: Alignment(-1.0, 0.0),
    end: Alignment(1.0, 0.0),
    colors: [
      Color(0xFF1A2E1A),
      Color(0xFF2E4A2E),
      Color(0xFF1A2E1A),
    ],
    stops: [0.0, 0.5, 1.0],
  );

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Get color for plant health status
  static Color getPlantHealthColor(String status) {
    switch (status.toLowerCase()) {
      case 'thriving':
        return plantThriving;
      case 'healthy':
        return plantHealthy;
      case 'good':
        return plantGood;
      case 'okay':
      case 'ok':
        return plantOkay;
      case 'attention':
      case 'needs attention':
        return plantAttention;
      case 'poor':
        return plantPoor;
      case 'critical':
      case 'unhealthy':
        return plantCritical;
      default:
        return textTertiary;
    }
  }

  /// Get gradient for plant health status
  static LinearGradient getPlantHealthGradient(String status) {
    switch (status.toLowerCase()) {
      case 'thriving':
      case 'healthy':
        return const LinearGradient(
          colors: [Color(0xFF00E676), Color(0xFF00C853)],
        );
      case 'good':
        return const LinearGradient(
          colors: [Color(0xFF76FF03), Color(0xFF64DD17)],
        );
      case 'okay':
        return const LinearGradient(
          colors: [Color(0xFFFFEB3B), Color(0xFFFFD740)],
        );
      case 'attention':
        return const LinearGradient(
          colors: [Color(0xFFFF9100), Color(0xFFFFAB00)],
        );
      case 'poor':
      case 'critical':
        return const LinearGradient(
          colors: [Color(0xFFFF6D00), Color(0xFFFF1744)],
        );
      default:
        return gradientPrimary;
    }
  }

  /// Get color for care type
  static Color getCareColor(String careType) {
    switch (careType.toLowerCase()) {
      case 'water':
      case 'watering':
        return needsWater;
      case 'sunlight':
      case 'light':
        return needsSunlight;
      case 'fertilizer':
      case 'soil':
        return needsFertilizer;
      case 'pruning':
      case 'trim':
        return needsPruning;
      case 'repotting':
      case 'repot':
        return needsRepotting;
      default:
        return primary;
    }
  }

  /// Get seasonal color
  static Color getSeasonColor(String season) {
    switch (season.toLowerCase()) {
      case 'spring':
        return spring;
      case 'summer':
        return summer;
      case 'autumn':
      case 'fall':
        return autumn;
      case 'winter':
        return winter;
      default:
        return primary;
    }
  }

  /// Get vibrant glow color
  static Color getGlowColor(Color baseColor, {double intensity = 0.5}) {
    return baseColor.withOpacity(intensity);
  }
}