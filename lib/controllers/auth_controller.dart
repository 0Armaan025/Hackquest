import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hackquest/models/hacker_model.dart';
import 'package:hackquest/repositories/auth_repository.dart';

class AuthController {
  void signUp(HackerModel model, BuildContext context, File imageFile) {
    AuthRepository().signUpHacker(model, context, imageFile);
  }

  void logIn(String email, String pass, BuildContext context) {
    AuthRepository().login(email, pass, context);
  }
}
