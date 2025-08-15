import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repository/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepo = AuthRepository();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  RxBool isLoading = false.obs;

  Future<void> signUp(String name, String email, String password) async {
    try {
      isLoading.value = true;
      UserModel? user = await _authRepo.signUp(
        name: name,
        email: email,
        password: password,
      );
      currentUser.value = user;

      if (user != null) {
        Get.offAllNamed("/homeView");
      }
    } catch (e) {
      Get.snackbar("Hata", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      UserModel? user = await _authRepo.login(email: email, password: password);
      currentUser.value = user;

      if (user != null) {
        Get.offAllNamed("/homeView");
      }
    } catch (e) {
      Get.snackbar("Hata", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // ✅ Move logout here
  Future<void> logout() async {
    await _authRepo.logout();
    currentUser.value = null;
    Get.offAllNamed("/login"); // Optional: Navigate back to login screen
  }
}
