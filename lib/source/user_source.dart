import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:myapp/config/session.dart';
import 'package:myapp/model/user.dart';

class UserSource {
  static Future<Map<String, dynamic>> signIn(
      String email, String password) async {
    Map<String, dynamic> response = {};
    try {
      final credential = await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      response['success'] = true;
      response['message'] = 'Sign In Success';
      String uid = credential.user!.uid;
      User user = await getWhereId(uid);
      Session.saveUser(user);
    } on auth.FirebaseAuthException catch (e) {
      response['success'] = false;
      if (e.code == 'user-not-found') {
        response['message'] = 'User Not Found';
      } else if (e.code == 'wrong-password') {
        response['message'] = 'Wrong Password';
      } else {
        response['message'] = e.message;
      }
    }
    return response;
  }

  static Future<User> getWhereId(String id) async {
    DocumentReference<Map<String, dynamic>> ref =
        FirebaseFirestore.instance.collection('user').doc(id);
    DocumentSnapshot<Map<String, dynamic>> doc = await ref.get();
    return User.fromJson(doc.data()!);
  }
}
