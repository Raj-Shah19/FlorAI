import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Track current page

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to FlorAI',
      'subtitle': 'The app that helps you take care of your plants with AI!',
      'image': 'assets/images/onboarding_1.png',
    },
    {
      'title': 'Identify Your Plants',
      'subtitle': 'Take a photo and get plant information in seconds.',
      'image': 'assets/images/onboarding_2.png',
    },
    {
      'title': 'AI Plant Care Tips',
      'subtitle': 'Daily reminders and AI-powered tips to keep your plants healthy.',
      'image': 'assets/images/onboarding_3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Expandable content area with PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPageContent(
                    title: onboardingData[index]['title']!,
                    subtitle: onboardingData[index]['subtitle']!,
                    imagePath: onboardingData[index]['image']!,
                  );
                },
              ),
            ),

            // Bottom section with indicator and buttons
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Page indicator
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: onboardingData.length,
                    effect: ExpandingDotsEffect(
                      dotColor: AppColors.textDisabled,
                      activeDotColor: AppColors.primary,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 3,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Fixed buttons that don't slide
                  if (_currentPage == onboardingData.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to main app screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Container(
                              color: AppColors.background,
                              child: Center(
                                child: Text(
                                  'Main App Screen',
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      style: AppTheme.primaryButtonStyle(),
                      child: const Text('Get Started'),
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Go to last page
                            _pageController.animateToPage(
                              onboardingData.length - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text('Skip'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Go to next page
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: AppTheme.primaryButtonStyle(),
                          child: const Text('Next'),
                        ),
                      ],
                    ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Separate widget for just the content that slides
class OnboardingPageContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const OnboardingPageContent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primary, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.eco,
                    size: 120,
                    color: AppColors.primary,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
