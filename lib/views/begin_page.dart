// lib/views/begin_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/onboarding_view_model.dart';
import '../models/onboarding_item.dart';
import 'authentification/signin_page.dart';

class BeginPage extends StatefulWidget {
  @override
  _BeginPageState createState() => _BeginPageState();
}

class _BeginPageState extends State<BeginPage> {
  final PageController _pageController = PageController();

  final List<OnboardingItem> items = [
    OnboardingItem(
      image: 'assets/images/welcome.png',
      title: 'Welcome To Spoozy Pay\nFinancial App!',
      description: 'Your trusted companion for smart financial management. Secure, fast, and user-friendly digital payments.',
    ),
    OnboardingItem(
      image: 'assets/images/task.png',
      title: 'Track Your Income And\nExpenses In One Place!',
      description: 'Get complete visibility of your finances with our comprehensive tracking and analytics tools.',
    ),
    OnboardingItem(
      image: 'assets/images/calen.png',
      title: 'Payments Scheduling\nMakes Life Easier!',
      description: 'Never miss a payment again with our intelligent scheduling system and reminders.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: viewModel.setPage,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return OnboardingSlide(item: items[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            items.length,
                                (index) => AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.only(right: 8),
                              height: 8,
                              width: viewModel.currentPage == index ? 24 : 8,
                              decoration: BoxDecoration(
                                color: viewModel.currentPage == index
                                    ? Theme.of(context).primaryColor
                                    : Colors.blueAccent[300],
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            if (viewModel.currentPage == items.length - 1)
                              TextButton(
                                onPressed: () {
                                  // Navigate to sign-in page
                                  print('hello word');

                                  // MaterialPageRoute(builder: (_) => SignInPage());

                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>const SignInPage()),);
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            SizedBox(width: 16),

                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingSlide({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: height * 0.5,
              child: Image.asset(
                item.image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 32),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Text(
                item.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}