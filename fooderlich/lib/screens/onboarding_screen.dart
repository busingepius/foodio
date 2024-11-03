import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/models.dart';

class OnboardingScreen extends StatefulWidget {
  // TODO: Add OnboardingScreen MaterialPage Helper
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Getting Started'),
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left,
            size: 35.0,
          ),
          onTap: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: buildPages()),
            buildIndicator(),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          child: const Text('Skip'),
          onPressed: () {
            Provider.of<AppStateManager>(context, listen: false).completeOnboarding();
          },
        ),
      ],
    );
  }

  Widget buildPages() {
    return PageView(
      controller: controller,
      children: [
        onboardingPageView(
          const AssetImage('assets/fooderlich_assets/recommend.png'),
          '''Check out weekly recommended recipes and what your friends are cooking!''',
        ),
        onboardingPageView(
          const AssetImage('assets/fooderlich_assets/sheet.png'),
          '''Cook with step by step instructions!''',
        ),
        onboardingPageView(
          const AssetImage('assets/fooderlich_assets/list.png'),
          '''Keep track of what you need to buy''',
        ),
      ],
    );
  }

  Widget onboardingPageView(ImageProvider imageProvider, String text) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image(fit: BoxFit.fitWidth, image: imageProvider),
          ),
          const SizedBox(height: 16.0),
          Text(
            text,
            style: const TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: WormEffect(activeDotColor: rwColor));
  }
}
