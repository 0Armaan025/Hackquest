import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const String appName = "HackQuest";
const String appTagLine = "Hack Together, Learn Together!";
const String appLogo = "assets/images/appLogo.png";

//firebase

var firestore = FirebaseFirestore.instance;
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;

//functions

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
    ),
  );
}

File? imageFile;

void pickImage(BuildContext context) async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    imageFile = File(image.path);
  } else {
    showSnackBar(context, 'Please select an image');
  }
}
