import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_complete/components/custom_button.dart';
import 'package:flutter_firebase_auth_complete/components/custom_textformfield.dart';
import 'package:flutter_firebase_auth_complete/services/auth_service.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController controllerEmail = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void resetPassword() async {
    try {
      await authService.value.resetPassowrd(email: controllerEmail.text);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Column(
            children: [
              CustomTextFormField(
                controller: controllerEmail,
                textHint: "Email",
                obscureText: false,
                enableSuggest: true,
                autoCorrect: true,
              ),
              SizedBox(height: 50),
              CustomButton(
                screenWidth: 300,
                text: "Send Email",
                callBack: () {
                  resetPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
