import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackquest/models/hacker_model.dart';
import 'package:hackquest/models/project_model.dart';
import 'package:hackquest/screens/add_message_screen.dart';
import 'package:hackquest/screens/hack_messages_screen.dart';
import 'package:hackquest/screens/profile_screen.dart';
import 'package:hackquest/utils/global_variables.dart';
import 'package:hackquest/utils/widgets/my_app_bar_2.dart';
import 'package:url_launcher/url_launcher.dart';

class HackScreen extends StatelessWidget {
  final ProjectModel model;
  HackScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(model.githubLink);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        child: MyAppBar2(),
        preferredSize: Size(double.infinity, kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.12,
                color: Colors.blue[700],
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(model.profilePicture),
                        radius: 30,
                      ),
                    ),
                    Container(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        print('hi');
                        String uid = "";
                        String name = "";
                        String email = "";
                        String phoneNumber = "";
                        String age = "";
                        String profilePicture = "";
                        var data = firestore
                            .collection('hackers')
                            .doc(model.userUid)
                            .get()
                            .then((DocumentSnapshot snapshot) {
                          uid = snapshot.get('uid');
                          name = snapshot.get('name');
                          email = snapshot.get('email');
                          age = snapshot.get('age');
                          phoneNumber = snapshot.get('phoneNumber');
                          profilePicture = snapshot.get('profilePicture');

                          HackerModel model = HackerModel(
                              name: name,
                              uid: uid,
                              phoneNumber: phoneNumber,
                              email: email,
                              password: '',
                              profilePicture: profilePicture,
                              age: age,
                              totalProjects: '');
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProfileScreen(model: model)));
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            model.userName,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            model.email,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: size.height * 0.12,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  model.name,
                  style: GoogleFonts.alata(
                    fontWeight: FontWeight.w400,
                    fontSize: 26,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                height: size.height * 0.3,
                child: Image(
                  image: NetworkImage(model.image),
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.35,
                  color: Colors.lime[200],
                  alignment: Alignment.center,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        model.description,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  print('hi');
                  launchUrl(_url);
                },
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.09,
                  color: Colors.deepPurple[600],
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      model.githubLink,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.message,
                          color: Colors.deepPurple,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HackMessagesScreen(
                                projectName: model.name,
                                userName: model.userName,
                                profilePicture: model.profilePicture,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddMessageScreen(
                                  projectName: model.name,
                                  profilePicture: model.profilePicture,
                                  userName: model.userName),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
