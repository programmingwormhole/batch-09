import 'package:flutter/material.dart';
import 'package:whatsapp_ui/utils/colors.dart';
import 'package:whatsapp_ui/views/auth/login/login.dart';
import 'package:whatsapp_ui/widgets/custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              Image.asset('assets/images/onboarding.png'),
              Column(
                children: [
                  const Text(
                    'Welcome to the app',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "We're excited to help you book and manage your service appointments with ease.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CustomButton(
                    label: 'Get Started',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomButton(
                    label: 'Create an account',
                    backgroundColor: Colors.transparent,
                    labelColor: AppColors.primaryColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
