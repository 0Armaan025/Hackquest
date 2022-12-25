import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackquest/models/message_model.dart';
import 'package:hackquest/screens/hack_messages_screen.dart';
import 'package:hackquest/screens/home_screen.dart';
import 'package:hackquest/utils/global_variables.dart';
import 'package:hackquest/utils/widgets/my_app_bar_2.dart';

class AddMessageScreen extends StatefulWidget {
  final projectName;
  final profilePicture;
  final userName;
  const AddMessageScreen(
      {Key? key,
      required this.projectName,
      required this.profilePicture,
      required this.userName})
      : super(key: key);

  @override
  State<AddMessageScreen> createState() => _AddMessageScreenState();
}

class _AddMessageScreenState extends State<AddMessageScreen> {
  final TextEditingController messageController = TextEditingController();
  int? documents;

  void sendMessage() async {
    print(documents);

    Random randomNumber = Random(100);
    MessageModel model = MessageModel(
      message: messageController.text,
      senderUid: firebaseAuth.currentUser?.uid ?? '',
      senderName: widget.userName,
      profilePicture: widget.profilePicture,
    );

    String datetime = DateTime.now().toString();
    print(datetime);

    firestore
        .collection('projects')
        .doc(widget.projectName)
        .collection('messages')
        .doc('message$datetime')
        .set(model.toMap());
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HackMessagesScreen(
            projectName: widget.projectName,
            userName: widget.userName,
            profilePicture: widget.profilePicture)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    messageController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: MyAppBar2(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text('Add your message here for ${widget.projectName}',
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  'Discuss your views with others',
                  style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  maxLength: 30,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Add your message here...',
                  ),
                  controller: messageController,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      sendMessage();
                    },
                    icon: Icon(Icons.done),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
