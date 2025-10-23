import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_complete/screens/home_screen.dart';
import 'package:flutter_firebase_auth_complete/screens/login_screen.dart';
import 'package:flutter_firebase_auth_complete/services/auth_service.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key, this.pageIfNotConnected});

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChange,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.hasData) {
              widget = const HomeScreen();
            } else {
              widget = pageIfNotConnected ?? const LoginScreen();
            }
            return widget;
          },
        );
      },
    );
  }
}
