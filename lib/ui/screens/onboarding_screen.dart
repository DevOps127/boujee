import 'package:boujee/ui/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF4B3A),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 73,
                  width: 73,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.colorWhite,
                  ),
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Food for\nEveryone',
                  style: GoogleFonts.roboto(
                    color: AppColors.colorWhite,
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                    height: .9,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -30,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/onboarding.png',
              height: 500,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 314,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
