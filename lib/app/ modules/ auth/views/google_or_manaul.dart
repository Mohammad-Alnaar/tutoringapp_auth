import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutoringapp_auth/app/config/routes/my_named_routes.dart';
import 'package:tutoringapp_auth/app/config/theme/my_colors.dart';
import 'package:tutoringapp_auth/app/core/extensions/%20context_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.secondary_400,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(context.translate.login,
            style: context.textTheme.headlineMedium
                ?.copyWith(fontSize: 16, color: MyColors.white)),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(MyNamedRoutes.register);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue), // Change this color
                ),
                child: Text(
                  context.translate.register,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: MyColors.black,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(MyNamedRoutes.register);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue), // Change this color
                ),
                child: Text(
                  context.translate.googleSign,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: MyColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
