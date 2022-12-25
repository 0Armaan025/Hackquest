import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackquest/screens/add_project_screen.dart';
import 'package:hackquest/screens/profile_screen.dart';
import 'package:hackquest/utils/global_variables.dart';

import '../../models/hacker_model.dart';

class MyAppBar2 extends StatefulWidget {
  MyAppBar2({Key? key}) : super(key: key);

  @override
  State<MyAppBar2> createState() => _MyAppBar2State();
}

class _MyAppBar2State extends State<MyAppBar2> {
  String userName = "";
  String uid = "";
  String phoneNumber = "";
  String email = "";
  String password = "";
  String age = "";
  String profilePicture = "";
  String totalProjects = "";

  HackerModel? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    var data = firestore
        .collection('hackers')
        .doc(firebaseAuth.currentUser?.uid ?? '')
        .get()
        .then((DocumentSnapshot snapshot) {
      userName = snapshot.get('name');
      uid = snapshot.get('uid');
      phoneNumber = snapshot.get('phoneNumber');
      email = snapshot.get('email');
      age = snapshot.get('age');
      profilePicture = snapshot.get('profilePicture');
      print(userName);
      print(uid);
      print(phoneNumber);
      print(email);
      model = HackerModel(
        name: userName,
        uid: uid,
        phoneNumber: phoneNumber,
        email: email,
        password: '',
        profilePicture: profilePicture,
        age: age,
        totalProjects: '0',
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2.0,
      backgroundColor: Colors.blue[300],
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('$appLogo'),
            backgroundColor: Colors.white,
          ),
          Container(
            width: 10,
          ),
          Text(
            '$appName',
            style: GoogleFonts.imFellDoublePica(),
          ),
          Container(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundColor: Colors.purple[200],
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AddProjectScreen()));
                },
                icon: Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              radius: 20,
            ),
          ),
          Container(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundColor: Colors.purple[200],
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileScreen(model: model!)));
                },
                icon: Icon(
                  Icons.person,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              radius: 20,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
