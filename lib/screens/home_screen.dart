import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_complete/components/custom_button.dart';
import 'package:flutter_firebase_auth_complete/screens/login_screen.dart';
import 'package:flutter_firebase_auth_complete/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    void logOut() async {
      try {
        await authService.value.signOut();
      } on FirebaseAuthException catch (e) {
        print(e.message);
      }
    }

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          children: [
            Text("Dashboard"),
            SizedBox(height: 300),
            CustomButton(
              screenWidth: screenWidth * .85,
              text: "Log Out",
              callBack: () {
                logOut();
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
