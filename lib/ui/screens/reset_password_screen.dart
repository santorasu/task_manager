import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/data/service/network_client.dart';
import 'package:task_management/data/utils/urls.dart';
import 'package:task_management/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_management/ui/widgets/screen_background.dart';
import 'package:task_management/ui/widgets/snack_bar_message.dart';

import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordTEController = TextEditingController();
  final TextEditingController _confirmNewPasswordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _resetInProgress = false;

  // Declare variables to store the email and OTP
  late String email;
  late String otp;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Retrieve arguments passed to this screen
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    email = arguments['email'];
    otp = arguments['OTP'];
  }

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
                  "Set Password",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 4),
                Text(
                  "Set a new password minimum length of 6 letters.",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 24),
                TextFormField(
                  controller: _newPasswordTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Enter New Password",
                  ),
                  validator: (String? value) {
                    if ((value?.isEmpty ?? true) || (value!.length < 6)) {
                      return 'Enter your password more than 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _confirmNewPasswordTEController,
                  decoration: InputDecoration(
                    hintText: "Confirm New Password",
                  ),
                  validator: (String? value) {
                    if ((value?.isEmpty ?? true) || (value!.length < 6)) {
                      return 'Enter your password more than 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onTapSubmitButton,
                  child: Visibility(
                    visible: !_resetInProgress,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: Text("Confirm"),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      children: [
                        const TextSpan(text: "Have account? "),
                        TextSpan(
                          text: "Sign In",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onTapSignInButton,
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

  // Submit Button Handler
  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {
      resetPassword();
    }
  }

  // Reset password API call
  Future<void> resetPassword() async {
    setState(() {
      _resetInProgress = true;
    });

    String newPassword = _newPasswordTEController.text;

    // Create the request body with email, OTP, and new password
    Map<String, dynamic> requestBody = {
      "email": email,  // Use the email passed from previous screen
      "OTP": otp,      // Use the OTP passed from previous screen
      "password": newPassword,
    };

    String url = Urls.recoverResetPasswordUrl;
    NetworkResponse response = await NetworkClient.postRequest(
      url: url,
      body: requestBody,
    );

    if (response.statusCode == 200) {
      if (!mounted) return;
      showSnackBarMessage(context, 'Password reset successful');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
            (pre) => false,
      );
    } else {
      showSnackBarMessage(context, 'Failed to reset password', true);
    }

    setState(() {
      _resetInProgress = false;
    });
  }

  // Navigate to Sign In screen
  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
          (pre) => false,
    );
  }

  @override
  void dispose() {
    _newPasswordTEController.dispose();
    _confirmNewPasswordTEController.dispose();
    super.dispose();
  }
}
