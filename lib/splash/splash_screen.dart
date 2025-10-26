import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../utils/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _plantController;
  late AnimationController _fadeController;
  late AnimationController _glowController;
  late AnimationController _particleController;

  late Animation<double> _plantGrowthAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _glowAnimation;
  late Animation<double> _particleAnimation;

  @override
  void initState() {
    super.initState();

    // Plant growth animation
    _plantController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _plantGrowthAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _plantController,
        curve: Curves.easeOutCubic,
      ),
    );

    // Fade in animation for text
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeInOut,
      ),
    );

    // Vibrant pulsing glow animation
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _glowController,
        curve: Curves.easeInOut,
      ),
    );

    // Floating particles animation
    _particleController = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    )..repeat();

    _particleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _particleController,
        curve: Curves.linear,
      ),
    );

    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 400));
    _plantController.forward();

    await Future.delayed(const Duration(milliseconds: 1500));
    _fadeController.forward();

    await Future.delayed(const Duration(milliseconds: 2500));
    if (mounted) {
      // Navigate to home screen
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      // );
    }
  }

  @override
  void dispose() {
    _plantController.dispose();
    _fadeController.dispose();
    _glowController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientBackground,
        ),
        child: Stack(
          children: [
            // Vibrant floating particles
            AnimatedBuilder(
              animation: _particleAnimation,
              builder: (context, child) {
                return CustomPaint(
                  size: Size.infinite,
                  painter: VibrantParticlesPainter(
                    animationValue: _particleAnimation.value,
                  ),
                );
              },
            ),

            // Glowing background pattern
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _glowAnimation,
                builder: (context, child) {
                  return CustomPaint(
                    painter: GlowingPatternPainter(
                      opacity: _glowAnimation.value * 0.15,
                    ),
                  );
                },
              ),
            ),

            // Main content
            Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),

                        // Vibrant animated plant with electric glow
                        AnimatedBuilder(
                          animation: Listenable.merge([
                            _plantController,
                            _glowController,
                          ]),
                          builder: (context, child) {
                            return Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(
                                      0.6 * _plantGrowthAnimation.value * _glowAnimation.value,
                                    ),
                                    blurRadius: 100,
                                    spreadRadius: 40,
                                  ),
                                  BoxShadow(
                                    color: AppColors.primaryLight.withOpacity(
                                      0.4 * _plantGrowthAnimation.value * _glowAnimation.value,
                                    ),
                                    blurRadius: 140,
                                    spreadRadius: 25,
                                  ),
                                  BoxShadow(
                                    color: AppColors.secondary.withOpacity(
                                      0.3 * _plantGrowthAnimation.value * _glowAnimation.value,
                                    ),
                                    blurRadius: 180,
                                    spreadRadius: 15,
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.35, // Responsive height
                                width: MediaQuery.of(context).size.height * 0.35,  // Keep aspect ratio
                                child: CustomPaint(
                                  painter: VibrantPlantPainter(
                                    growthProgress: _plantGrowthAnimation.value,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height * 0.06), // Responsive spacing

                        // Animated app name with vibrant colors
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Column(
                            children: [
                              // Glowing top line
                              Container(
                                width: 70,
                                height: 2,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      AppColors.primary,
                                      AppColors.primaryLight,
                                      AppColors.secondary,
                                      Colors.transparent,
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primary.withOpacity(0.8),
                                      blurRadius: 15,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Vibrant app name
                              ShaderMask(
                                shaderCallback: (bounds) => const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white,
                                    AppColors.primaryLight,
                                    AppColors.primary,
                                  ],
                                ).createShader(bounds),
                                child: const Text(
                                  'FlorAI',
                                  style: TextStyle(
                                    fontSize: 56,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    letterSpacing: 10,
                                    height: 1.2,
                                    shadows: [
                                      Shadow(
                                        color: AppColors.primary,
                                        blurRadius: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              // Bright accent line
                              Container(
                                width: 45,
                                height: 3,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.primary,
                                      AppColors.secondary,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primary.withOpacity(0.9),
                                      blurRadius: 18,
                                      spreadRadius: 3,
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 22),

                              // Vibrant tagline
                              Text(
                                'YOUR AI PLANT COMPANION',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.primaryLight,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 3.5,
                                  shadows: [
                                    Shadow(
                                      color: AppColors.primary.withOpacity(0.8),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Spacer(flex: 3),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VibrantParticlesPainter extends CustomPainter {
  final double animationValue;

  VibrantParticlesPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final colors = [
      AppColors.primaryLight,
      AppColors.secondary,
      AppColors.accentMint,
      AppColors.accentJade,
    ];

    // Create vibrant floating particles
    for (int i = 0; i < 30; i++) {
      final seed = i * 137.5;
      final x = (size.width * 0.05) + (size.width * 0.9) * ((seed % 100) / 100);
      final y = size.height * ((animationValue + (seed % 100) / 100) % 1.0);
      final radius = 1.5 + (seed % 3.5);
      final colorIndex = i % colors.length;
      final opacity = (0.3 + (seed % 50) / 100);

      final paint = Paint()
        ..color = colors[colorIndex].withOpacity(opacity)
        ..style = PaintingStyle.fill;

      // Draw particle
      canvas.drawCircle(Offset(x, y), radius, paint);

      // Add glow
      final glowPaint = Paint()
        ..color = colors[colorIndex].withOpacity(opacity * 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

      canvas.drawCircle(Offset(x, y), radius * 2, glowPaint);
    }
  }

  @override
  bool shouldRepaint(VibrantParticlesPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

class GlowingPatternPainter extends CustomPainter {
  final double opacity;

  GlowingPatternPainter({required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withOpacity(opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Draw glowing organic patterns
    for (int i = 0; i < 12; i++) {
      final path = Path();
      final x = size.width * (0.05 + i * 0.09);
      final y = size.height * (0.12 + (i % 4) * 0.24);

      path.moveTo(x, y);
      path.quadraticBezierTo(x + 22, y - 42, x + 48, y - 10);
      path.quadraticBezierTo(x + 58, y + 10, x + 48, y + 20);

      canvas.drawPath(path, paint);

      // Add glow to pattern
      final glowPaint = Paint()
        ..color = AppColors.primaryLight.withOpacity(opacity * 0.5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

      canvas.drawPath(path, glowPaint);
    }
  }

  @override
  bool shouldRepaint(GlowingPatternPainter oldDelegate) {
    return oldDelegate.opacity != opacity;
  }
}

class VibrantPlantPainter extends CustomPainter {
  final double growthProgress;

  VibrantPlantPainter({required this.growthProgress});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    if (growthProgress > 0) {
      _drawVibrantPlant(canvas, centerX, centerY, size);
    }
  }

  void _drawVibrantPlant(Canvas canvas, double centerX, double centerY, Size size) {
    // Vibrant glowing stem
    final stemPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primaryLight,
          AppColors.primary,
          AppColors.primaryDark,
        ],
      ).createShader(
        Rect.fromLTWH(centerX - 5, centerY - 85, 10, 170 * growthProgress),
      )
      ..style = PaintingStyle.fill;

    // Draw stem with glow
    final stemGlowPaint = Paint()
      ..shader = const LinearGradient(
        colors: [AppColors.primaryLight, AppColors.primary],
      ).createShader(
        Rect.fromLTWH(centerX - 8, centerY - 85, 16, 170 * growthProgress),
      )
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    final stemPath = Path();
    stemPath.moveTo(centerX - 4, centerY + 85 * growthProgress);
    stemPath.quadraticBezierTo(
      centerX - 1,
      centerY + 25 * growthProgress,
      centerX + 2,
      centerY - 85 * growthProgress,
    );
    stemPath.lineTo(centerX - 2, centerY - 85 * growthProgress);
    stemPath.quadraticBezierTo(
      centerX + 1,
      centerY + 25 * growthProgress,
      centerX + 4,
      centerY + 85 * growthProgress,
    );
    stemPath.close();

    canvas.drawPath(stemPath, stemGlowPaint);
    canvas.drawPath(stemPath, stemPaint);

    // Draw vibrant leaves with updated position based on growth
    if (growthProgress > 0.15) {
      final leaf1Progress = ((growthProgress - 0.15) / 0.85).clamp(0.0, 1.0);
      final leaf1Size = 78 * leaf1Progress;
      _drawVibrantLeaf(canvas, centerX, centerY, -leaf1Size, -18, leaf1Size, -28, leaf1Progress);
    }

    if (growthProgress > 0.3) {
      final leaf2Progress = ((growthProgress - 0.3) / 0.7).clamp(0.0, 1.0);
      final leaf2Size = 82 * leaf2Progress;
      _drawVibrantLeaf(canvas, centerX, centerY, 0, -40, leaf2Size, 24, leaf2Progress);
    }

    if (growthProgress > 0.45) {
      final leaf3Progress = ((growthProgress - 0.45) / 0.55).clamp(0.0, 1.0);
      final leaf3Size = 70 * leaf3Progress;
      _drawVibrantLeaf(canvas, centerX, centerY, -leaf3Size, 8, leaf3Size, -30, leaf3Progress);
    }

    if (growthProgress > 0.6) {
      final leaf4Progress = ((growthProgress - 0.6) / 0.4).clamp(0.0, 1.0);
      final leaf4Size = 75 * leaf4Progress;
      _drawVibrantLeaf(canvas, centerX, centerY, 0, 3, leaf4Size, 26, leaf4Progress);
    }

    if (growthProgress > 0.75) {
      final leaf5Progress = ((growthProgress - 0.75) / 0.25).clamp(0.0, 1.0);
      final leaf5Size = 65 * leaf5Progress;
      _drawVibrantLeaf(canvas, centerX, centerY, -leaf5Size, -55, leaf5Size, -12, leaf5Progress);
    }

    // Add bright flowers only when growth is more than 80%
    if (growthProgress > 0.8) {
      final flowerProgress = ((growthProgress - 0.8) / 0.2).clamp(0.0, 1.0);
      _drawVibrantFlowers(canvas, centerX, centerY, flowerProgress);
    }
  }

  void _drawVibrantLeaf(Canvas canvas, double centerX, double centerY, double offsetX, double offsetY, double size, double rotation, double progress) {
    canvas.save();
    canvas.translate(centerX + offsetX, centerY + offsetY);
    canvas.rotate(rotation * math.pi / 180);

    // Leaf glow
    final glowPaint = Paint()
      ..shader = const RadialGradient(
        colors: [AppColors.primaryLight, AppColors.primary],
        radius: 1.2,
      ).createShader(Rect.fromCircle(center: Offset(size * 0.4, 0), radius: size))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    final leafPath = _createLeafPath(size, 0);
    canvas.drawPath(leafPath, glowPaint);

    // Main vibrant leaf
    final leafPaint = Paint()
      ..shader = const RadialGradient(
        center: Alignment(-0.3, -0.3),
        radius: 1.2,
        colors: [
          AppColors.primaryLight,
          AppColors.primary,
          AppColors.primaryDark,
        ],
      ).createShader(Rect.fromCircle(center: Offset(size * 0.4, 0), radius: size))
      ..style = PaintingStyle.fill;

    canvas.drawPath(leafPath, leafPaint);

    // Bright outline
    final outlinePaint = Paint()
      ..color = AppColors.primaryLight.withOpacity(0.4)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    canvas.drawPath(leafPath, outlinePaint);

    // Glowing veins
    final veinPaint = Paint()
      ..color = AppColors.primaryLight.withOpacity(0.6)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

    canvas.drawLine(Offset.zero, Offset(size * 0.88, 0), veinPaint);

    for (int i = 1; i <= 6; i++) {
      final veinX = size * i / 7;
      final veinLength = size * 0.25;
      canvas.drawLine(
        Offset(veinX, 0),
        Offset(veinX + veinLength * 0.35, -veinLength),
        veinPaint..strokeWidth = 1.2,
      );
      canvas.drawLine(
        Offset(veinX, 0),
        Offset(veinX + veinLength * 0.35, veinLength),
        veinPaint,
      );
    }

    canvas.restore();
  }

  Path _createLeafPath(double size, double offset) {
    final path = Path();
    path.moveTo(offset, offset);
    path.quadraticBezierTo(
      size * 0.22 + offset, -size * 0.38 + offset,
      size * 0.48 + offset, -size * 0.42 + offset,
    );
    path.quadraticBezierTo(
      size * 0.78 + offset, -size * 0.40 + offset,
      size + offset, -size * 0.08 + offset,
    );
    path.quadraticBezierTo(
      size * 0.92 + offset, offset,
      size + offset, size * 0.08 + offset,
    );
    path.quadraticBezierTo(
      size * 0.78 + offset, size * 0.40 + offset,
      size * 0.48 + offset, size * 0.42 + offset,
    );
    path.quadraticBezierTo(
      size * 0.22 + offset, size * 0.38 + offset,
      offset, offset,
    );
    path.close();
    return path;
  }

  void _drawVibrantFlowers(Canvas canvas, double centerX, double centerY, double progress) {
    // Main flower at the top of the stem (stem ends at centerY - 85)
    _drawBrightFlower(canvas, Offset(centerX, centerY - 85), Colors.white, AppColors.accentSunlight, 16 * progress, progress);
    if (progress > 0.4) {
      _drawBrightFlower(canvas, Offset(centerX - 45, centerY - 65), const Color(0xFFFFE0F0), AppColors.accentBloom, 14 * (progress - 0.4) / 0.6, (progress - 0.4) / 0.6);
    }
    if (progress > 0.6) {
      _drawBrightFlower(canvas, Offset(centerX + 50, centerY - 70), const Color(0xFFE0F0FF), AppColors.accentAqua, 15 * (progress - 0.6) / 0.4, (progress - 0.6) / 0.4);
    }
  }

  void _drawBrightFlower(Canvas canvas, Offset center, Color petalColor, Color centerColor, double size, double progress) {
    canvas.save();
    canvas.translate(center.dx, center.dy);

    // Vibrant glow
    final glowPaint = Paint()
      ..shader = RadialGradient(colors: [centerColor, centerColor.withOpacity(0.0)], radius: 2.0)
          .createShader(Rect.fromCircle(center: Offset.zero, radius: size * 2))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

    canvas.drawCircle(Offset.zero, size * 2, glowPaint);

    // Bright petals
    for (int i = 0; i < 5; i++) {
      canvas.save();
      canvas.rotate((i * 72 - 18) * math.pi / 180);

      final petalPaint = Paint()
        ..shader = RadialGradient(
          colors: [petalColor, petalColor.withOpacity(0.9), petalColor.withOpacity(0.75)],
        ).createShader(Rect.fromCircle(center: Offset(0, -size * 0.5), radius: size * 0.8));

      final petalPath = Path();
      petalPath.moveTo(0, 0);
      petalPath.quadraticBezierTo(size * 0.16, -size * 0.42, size * 0.28, -size * 0.75);
      petalPath.quadraticBezierTo(0, -size * 0.85, -size * 0.28, -size * 0.75);
      petalPath.quadraticBezierTo(-size * 0.16, -size * 0.42, 0, 0);
      petalPath.close();

      canvas.drawPath(petalPath, petalPaint);
      canvas.restore();
    }

    // Bright center
    final centerPaint = Paint()
      ..shader = RadialGradient(colors: [centerColor, centerColor.withOpacity(0.8)])
          .createShader(Rect.fromCircle(center: Offset.zero, radius: size * 0.3));

    canvas.drawCircle(Offset.zero, size * 0.3, centerPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(VibrantPlantPainter oldDelegate) {
    return oldDelegate.growthProgress != growthProgress;
  }
}