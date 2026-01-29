import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginScreen.dart';

class OnboardingScreenMain extends StatefulWidget {
  const OnboardingScreenMain({super.key});

  @override
  State<OnboardingScreenMain> createState() => _OnboardingScreenMainState();
}

class _OnboardingScreenMainState extends State<OnboardingScreenMain> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'image': "assets/png/ShopFreshGroceries.png",
      'title': "Shop Fresh Groceries",
      'subtitle':
          "Browse thousands of products from local\nstores and supermarkets",
      'buttonText': "Next →",
    },

    {
      'image': "assets/png/fastDelivery.png",
      'title': "Fast Delivery",
      'subtitle':
          "Get your groceries delivered to your doorstep\nin 30 minutes or less",
      'buttonText': "Next →",
    },

    {
      'image': "assets/png/trackYourOrder.png",
      'title': "Track Your Order",
      'subtitle':
          "Real-time tracking of your delivery driver\nand order status",
      'buttonText': "Get Started →",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Skip button
            Positioned(
              top: 16.h,
              right: 24.w,
              child: GestureDetector(
                onTap: () {
                  // TODO: Skip to login or home
                  Navigator.pushReplacementNamed(
                    context,
                    '/login',
                  ); // या तुम्हारा route
                },
                child: Text(
                  "Skip",
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF16A34A),
                  ),
                ),
              ),
            ),

            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final page = _pages[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 150.h),
                      index == 0
                          ? Container(
                              height: 128.h,
                              width: 128.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffF5F5F5)),
                                // borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.circle,
                                // color: const Color(0xFF16A34A),
                              ),
                              child: Center(
                                child: Image.asset(
                                  page['image'],
                                  height: 60.h,
                                  width: 60.h,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          : Container(
                              height: 128.h,
                              width: 128.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF16A34A),
                              ),
                              child: Center(
                                child: Image.asset(
                                  page['image'],
                                  height: 60.h,
                                  width: 60.h,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),

                      SizedBox(height: 48.h),

                      // Title
                      Text(
                        page['title'],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Subtitle
                      Text(
                        page['subtitle'],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFA3A3A3),
                          height: 1.4,
                        ),
                      ),

                      SizedBox(height: 48.h),

                      // SizedBox(height: 40.h),
                      Expanded(child: SizedBox()),

                      // Page Indicator Dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _pages.length,
                          (i) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Container(
                              height: 10.h,
                              width: 10.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: i == _currentPage
                                    ? const Color(0xFF16A34A)
                                    : const Color(0xFFD9D9D9),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Next / Get Started Button
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: double.infinity,
                        height: 58.h,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage < _pages.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );

                              // Last page → Go to Login/SignUp
                              // Navigator.pushReplacementNamed(context, '/login');
                              // या: Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF16A34A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            page['buttonText'],
                            style: GoogleFonts.montserrat(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 40.h),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
