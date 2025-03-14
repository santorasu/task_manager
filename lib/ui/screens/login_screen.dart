import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/widgets/screen_background.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
                Text("Get Started with",
                style: Theme.of(context).textTheme.titleLarge,),
                SizedBox(height: 24,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
            SizedBox(height: 16,),
                ElevatedButton(
                    onPressed: (){}, child: const Icon(Icons.arrow_circle_right_outlined)),
            SizedBox(height: 16,),
            Center(
              child: Column(
                children: [
                  TextButton(
                      onPressed: _onTapForgotPasswordButton,
                      child: Text("Forgot Password?")),
                  RichText(text: TextSpan(
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(text: "Don't have account? "),
                      TextSpan(text: "Sign In",style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold
                      ),
                        recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,
                      ),
                    ]
                  )),
                ],
              ),
            )

              ]
          ),
        ),
    ),
    );
  }
  void _onTapSignInButton(){}
  void _onTapForgotPasswordButton(){}
}
