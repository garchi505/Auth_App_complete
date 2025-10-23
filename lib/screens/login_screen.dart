import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_complete/components/custom_button.dart';
import 'package:flutter_firebase_auth_complete/components/custom_textformfield.dart';
import 'package:flutter_firebase_auth_complete/screens/forgotpass_screen.dart';
import 'package:flutter_firebase_auth_complete/screens/register_screen.dart';
import 'package:flutter_firebase_auth_complete/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  String errorMessage = '';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void signIn() async {
    try {
      await authService.value.signIn(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
      popPage();
    } on FirebaseException catch (e) {
      setState(() {
        print(errorMessage = e.message ?? "This is not working...");
      });
    }
  }

  void popPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Log In")),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100, width: 100, child: Text("My App Image")),
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: controllerEmail,
              textHint: "Email",
              obscureText: false,
              autoCorrect: false,
              enableSuggest: true,
            ),
            CustomTextFormField(
              controller: controllerPassword,
              obscureText: true,
              autoCorrect: false,
              enableSuggest: false,
              textHint: "Password",
            ),
            SizedBox(height: 25),
            CustomButton(
              screenWidth: screenWidth,
              text: "Log in",
              callBack: () {
                signIn();
              },
            ),
            Text(errorMessage, style: TextStyle(color: Colors.red)),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const ForgotPassword(),
                  ),
                ),
              },
              child: Text(
                "Forgot Password",
                style: TextStyle(fontSize: 14, color: Color(0xFFC19EE0)),
              ),
            ),
            Container(
              height: 1,
              width: screenWidth * .55,
              color: Color(0xFFC19EE0),
              margin: EdgeInsets.all(5),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                ),
              },
              child: Text(
                "Create an Account",
                style: TextStyle(fontSize: 14, color: Color(0xFFC19EE0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
