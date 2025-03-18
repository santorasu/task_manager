import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

import 'login_screen.dart';

class ForgotPasswordPinVerificationScreen extends StatefulWidget {
  const ForgotPasswordPinVerificationScreen({super.key});

  @override
  State<ForgotPasswordPinVerificationScreen> createState() =>
      _ForgotPasswordPinVerificationScreenState();
}

class _ForgotPasswordPinVerificationScreenState
    extends State<ForgotPasswordPinVerificationScreen> {
  final TextEditingController _pinCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Text(
                  "Pin Verification",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 4),
                Text(
                  "A 6 digit verification pin has been sent to your email",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 24),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: _pinCodeController,
                  appContext: context,
                ),

                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(text: "Have account? "),
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = _onTapSignUpButton,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (pre) => false,
    );
  }
}
