import 'package:boujee/routes.dart';
import 'package:boujee/ui/constants/colors.dart';
import 'package:boujee/ui/shared/buttons/default_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        systemNavigationBarColor: AppColors.primaryColor,
      ),
      child: Scaffold(
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
              left: 24,
              right: 24,
              bottom: 16,
              child: Center(
                child: DefaultRaisedButton(
                  onTap: () => Navigator.of(context)
                      ?.pushNamed(RouteGenerator.connexionScreen),
                  text: 'Get started',
                  backgroundColor: AppColors.colorWhite,
                  textColor: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
