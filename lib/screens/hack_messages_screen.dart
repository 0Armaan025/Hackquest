import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackquest/models/message_model.dart';
import 'package:hackquest/utils/global_variables.dart';
import 'package:hackquest/utils/widgets/message_widget.dart';
import 'package:hackquest/utils/widgets/my_app_bar_2.dart';

import '../utils/widgets/text_field_form.dart';

class HackMessagesScreen extends StatefulWidget {
  final projectName;
  final userName;
  final profilePicture;
  const HackMessagesScreen(
      {Key? key,
      required this.projectName,
      required this.userName,
      required this.profilePicture})
      : super(key: key);

  @override
  State<HackMessagesScreen> createState() => _HackMessagesScreenState();
}

class _HackMessagesScreenState extends State<HackMessagesScreen> {
  final TextEditingController messageController = TextEditingController();

  void submitMsg(String msg) {
    Random random = new Random();
    int randomNumber = random.nextInt(1000); //

    MessageModel model = MessageModel(
        message: msg,
        senderUid: firebaseAuth.currentUser?.uid ?? '',
        senderName: widget.userName,
        profilePicture: widget.profilePicture);
    firestore
        .collection('projects')
        .doc(widget.projectName)
        .collection('messages')
        .doc('message$randomNumber')
        .set(model.toMap());

    messageController.text = "";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: MyAppBar2(),
      ),
      body: Container(
        child: StreamBuilder(
          stream: firestore
              .collection('projects')
              .doc(widget.projectName)
              .collection('messages')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot message = snapshot.data!.docs[index];
                return MessageWidget(
                    userName: message['senderName'],
                    message: message['message'],
                    profilePicture: message['profilePicture']);
              },
            );
          },
        ),
      ),
    );
  }
}
