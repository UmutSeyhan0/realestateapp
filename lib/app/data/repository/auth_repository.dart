import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Kullanıcı kaydı
  Future<UserModel?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel newUser = UserModel(
        id: cred.user!.uid,
        name: name,
        email: email,
        createdAt: DateTime.now(),
      );

      await _firestore
          .collection('users')
          .doc(cred.user!.uid)
          .set(newUser.toMap());

      return newUser;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Giriş
  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      DocumentSnapshot doc = await _firestore
          .collection('users')
          .doc(cred.user!.uid)
          .get();

      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Çıkış
  Future<void> logout() async {
    await _auth.signOut();
  }
}
