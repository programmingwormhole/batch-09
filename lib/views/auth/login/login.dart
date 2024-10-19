import 'package:flutter/material.dart';
import 'package:whatsapp_ui/utils/colors.dart';
import 'package:whatsapp_ui/widgets/custom_button.dart';
import 'package:whatsapp_ui/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isSecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "Welcome back to the app .",
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomTextField(
              label: 'Email Address',
              hintText: 'hello@example.com',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'Password',
              secondaryLabel: 'Forgot Password?',
              hintText: 'Enter your password',
              isSecured: isSecured,
              onSecondaryLabelTap: () {
                print('Pressed');
              },
              trailing: IconButton(
                onPressed: () {
                  isSecured = !isSecured;

                  setState(() {});
                },
                icon: Icon(
                  isSecured ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomButton(label: 'Login'),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black.withOpacity(.1),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'or sign in with',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black.withOpacity(.1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomButton(
              label: 'Continue with Google',
              backgroundColor: Color(0xFFE4E7EB),
              labelColor: Colors.black,
              icon: 'assets/images/google_logo.png',
            ),
            CustomButton(
              label: 'Create an account',
              backgroundColor: Colors.transparent,
              labelColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
