import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            key: _formKey,
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  Text(
                    "Join With Us",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTEController,
                      decoration: InputDecoration(hintText: 'Email')),
                  SizedBox(height: 8),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: _firstNameTEController,
                    decoration: InputDecoration(hintText: 'First Name'),
                  ),
                  SizedBox(height: 8),

                  TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _lastNameTEController,
                      decoration: InputDecoration(hintText: 'Last Name')),
                  SizedBox(height: 8),

                  TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      controller: _mobileTEController,
                      decoration: InputDecoration(hintText: 'Mobile')),
                  SizedBox(height: 8),
                  TextFormField(
                      controller: _passwordTEController,
                      decoration: InputDecoration(hintText: 'Password')),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onTabSubmitButton,
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
                          TextSpan(text: "Already have an account? "),
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer:
                            TapGestureRecognizer()
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
      ),
    );
  }

  void _onTabSubmitButton(){

}
  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
