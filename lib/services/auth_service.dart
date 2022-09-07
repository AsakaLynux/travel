import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel/models/user_model.dart';
import 'package:travel/services/user_service.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    String hobby = '',
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
          id: userCredential.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
          balance: 280000000);

      await UserSevice().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }
}
