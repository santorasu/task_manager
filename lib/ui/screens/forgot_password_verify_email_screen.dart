import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

import 'forgot_password_pin_verification_screen.dart';


class ForgotPasswordVerifyEmailScreen extends StatefulWidget {
  const ForgotPasswordVerifyEmailScreen({super.key});

  @override
  State<ForgotPasswordVerifyEmailScreen> createState() => _ForgotPasswordVerifyEmailScreenState();
}

class _ForgotPasswordVerifyEmailScreenState extends State<ForgotPasswordVerifyEmailScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScreenBackground(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80,),
                Text("Your Email Address",
                  style: Theme.of(context).textTheme.titleLarge,),
                SizedBox(height: 4,),
                Text("A 6 digit verification pin will be sent to your email",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey
                  ),),
                SizedBox(height: 24,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 16,),
                ElevatedButton(
                    onPressed: _onTapSubmitButton, child: const Icon(Icons.arrow_circle_right_outlined ,color: Colors.white,size: 24,)),
                SizedBox(height: 32,),
                Center(
                  child: RichText(text: TextSpan(
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(text: "Have account? "),
                        TextSpan(text: "Sign In",style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold
                        ),
                          recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,
                        ),
                      ]
                  )),
                )

              ]
          ),
        ),
      ),
    ),
    );
  }

  void _onTapSubmitButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgotPasswordPinVerificationScreen(),
      ),
    );
  }
  void _onTapSignInButton(){
    Navigator.pop(context);
  }


  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
