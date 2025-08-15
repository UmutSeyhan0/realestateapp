import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapp/app/widgets/inputs/app_text_field.dart';
import 'package:realestateapp/core/components/app_text_widget.dart';

import '../controllers/auth_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final AuthController controller = Get.find<AuthController>();

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          // Üstte gradient arka plan
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorScheme.primary, colorScheme.primary.withValues()],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  top: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo (örnek)
                      Icon(
                        Icons.home_work_rounded,
                        size: 64,
                        color: colorScheme.onPrimary,
                      ),
                      const SizedBox(height: 8),
                      AppTextWidget(
                        "Estate",
                        style: textTheme.headlineSmall?.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Alt kısım
          Container(
            height: MediaQuery.of(context).size.height * .65,
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Center(
                  child: AppTextWidget(
                    "Register",

                    style: textTheme.headlineSmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Username
                const SizedBox(height: 8),

                // Password
                AppTextField(
                  label: "Username",
                  prefixIcon: Icon(Icons.person, color: Colors.orange),
                  iconColor: Colors.orange.shade100,
                  controller: controller.nameController,
                ),
                const SizedBox(height: 15),
                AppTextField(
                  label: "Email",
                  prefixIcon: Icon(Icons.mail, color: Colors.green),
                  iconColor: Colors.green.shade100,
                  controller: controller.emailController,
                ),

                const SizedBox(height: 15),
                AppTextField(
                  label: "Password",
                  prefixIcon: Icon(Icons.lock, color: Colors.blue),
                  iconColor: Colors.blue.shade100,
                  controller: controller.passwordController,
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      controller.signUp(
                        controller.nameController.text,
                        controller.emailController.text,
                        controller.passwordController.text,
                      );
                    },
                    child: const AppTextWidget(
                      "Register",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.offAllNamed("/loginView");
                    },
                    child: AppTextWidget(
                      "Do you have an account?",
                      style: TextStyle(
                        color: colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),

                const Spacer(),
                // Sosyal giriş ikonları
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIconButton(Icons.facebook, Colors.blue),
                    const SizedBox(width: 16),
                    _socialIconButton(Icons.g_mobiledata, Colors.red),
                    const SizedBox(width: 16),
                    _socialIconButton(Icons.apple, Colors.grey),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIconButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: color.withOpacity(0.1),
      child: Icon(icon, color: color, size: 28),
    );
  }
}
