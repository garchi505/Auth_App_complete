import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_complete/components/custom_button.dart';
import 'package:flutter_firebase_auth_complete/components/custom_textformfield.dart';
import 'package:flutter_firebase_auth_complete/screens/home_screen.dart';
import 'package:flutter_firebase_auth_complete/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  void register() async {
    try {
      await authService.value.createAccount(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void popPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
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
              text: "Register",
              callBack: () {
                register();
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () => {},
              child: Text(
                "Already Have An Account",
                style: TextStyle(fontSize: 14, color: Color(0xFFC19EE0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
