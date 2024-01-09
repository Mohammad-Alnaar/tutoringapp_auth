import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutoringapp_auth/app/config/routes/my_named_routes.dart';
import 'package:tutoringapp_auth/app/core/extensions/%20context_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.orange,
            height: context.screenHeight * 0.3,
            width: context.screenWidth * 0.2,
            child: Center(
                child: GestureDetector(
                    onTap: () {
                      context.pushNamed(MyNamedRoutes.login);
                    },
                    child: Text("Connect")))),
      ),
    );
  }
}
