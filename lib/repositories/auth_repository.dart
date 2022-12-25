import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackquest/models/hacker_model.dart';
import 'package:hackquest/utils/global_variables.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import '../screens/home_screen.dart';

final String accountSid = 'ACb4cf88e58cb192edd990d56ffc944198';
final String authToken = 'a6c96a11c6bd6c5052d5d499873990c3';
final String fromPhoneNumber = '+17207828068';
final String message = 'Hello from Flutter!';

TwilioFlutter twilioFlutter = TwilioFlutter(
  accountSid: accountSid, // replace *** with Account SID
  authToken: authToken, // replace xxx with Auth Token
  twilioNumber: fromPhoneNumber, // replace .... with Twilio Number
);

class AuthRepository {
  //function to sign up a new user

  void validate(HackerModel model, BuildContext context, File image) async {
    if (model.password.length < 8) {
      showSnackBar(context, 'The password must be atleast of 8 characters');
    } else if (int.parse(model.age) < 12 ||
        int.parse(model.age) < 0 ||
        int.parse(model.age) > 60) {
      showSnackBar(context, 'Invalid age!');
    } else {
      try {
        firebaseAuth.createUserWithEmailAndPassword(
            email: model.email, password: model.password);

        Reference reference =
            firebaseStorage.ref('profilePictures/${model.name}');
        UploadTask uploadTask = reference.putFile(image);
        final storageSnapshot = uploadTask.snapshot;
        final downloadUrl = await storageSnapshot.ref.getDownloadURL();
        print('download url is $downloadUrl');

        HackerModel newModel = HackerModel(
            name: model.name,
            uid: model.uid,
            phoneNumber: model.phoneNumber,
            email: model.email,
            password: model.password,
            profilePicture: downloadUrl,
            age: model.age,
            totalProjects: model.totalProjects);

        model = newModel;

        await firestore
            .collection('hackers')
            .doc(firebaseAuth.currentUser?.uid ?? '')
            .set(model.toMap());

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));

        twilioFlutter.sendSMS(
            toNumber: '+91${model.phoneNumber}',
            messageBody: 'hello ${model.name}, welcome to HackQuest!');
      } catch (e) {
        showSnackBar(context, e.toString());
      }
    }
  }

  void signUpHacker(HackerModel model, BuildContext context, File imageFile) {
    validate(model, context, imageFile);
  }

  void login(String email, String pass, BuildContext context) {
    try {
      firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
