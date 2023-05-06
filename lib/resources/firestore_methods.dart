import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jobs_app/controllers/user_controller.dart';
import 'package:jobs_app/models/user.dart' as model;
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> postJob() async {
    final userProvider = Get.find<UserProvider>();
    final model.User user = userProvider.getUser;
    String postId = const Uuid().v1();
    try {
      _firestore
          .collection('users')
          .doc(user.uid)
          .collection('jobs')
          .doc(postId)
          .set({});
    } catch (e) {
      print(e);
    }
  }
}
