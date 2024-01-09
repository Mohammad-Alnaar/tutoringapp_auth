import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutoringapp_auth/app/%20modules/%20auth/domain/providers/auth_providers.dart';
import 'package:tutoringapp_auth/app/%20modules/%20auth/widgets/my_forms_widgets.dart';
import 'package:tutoringapp_auth/app/config/theme/my_colors.dart';
import 'package:tutoringapp_auth/app/core/extensions/%20context_extension.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  final registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    final formProvider = ref.watch(authFormController);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.secondary_400,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(context.translate.register,
            style: context.textTheme.headlineMedium
                ?.copyWith(fontSize: 16, color: MyColors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyAuthForm(
              registerFormKey: registerFormKey,
            ),
            SizedBox(
              height: context.screenHeight * 0.04,
            ),
            ElevatedButton(
              onPressed: () {
                if (registerFormKey.currentState?.validate() == true) {
                  authController.register(
                    email: formProvider.email,
                    userName: formProvider.userName,
                    password: formProvider.password,
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.blue), // Change this color
              ),
              child: Text(
                context.translate.login,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: MyColors.black,
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     if (registerFormKey.currentState?.validate() == true) {
            //       authController.register(
            //         email: formProvider.email,
            //         userName: formProvider.userName,
            //         password: formProvider.password,
            //       );
            //     }
            //   },
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all<Color>(
            //         Colors.blue), // Change this color
            //   ),
            //   child: Text(
            //     context.translate.googleSign,
            //     style: context.textTheme.bodyLarge?.copyWith(
            //       fontWeight: FontWeight.bold,
            //       color: MyColors.black,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
