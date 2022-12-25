import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackquest/models/project_model.dart';
import 'package:hackquest/screens/hack_screen.dart';
import 'package:hackquest/utils/widgets/hack_widget.dart';
import 'package:hackquest/utils/widgets/my_app_bar_2.dart';

import '../utils/global_variables.dart';

class ProjectsScreen extends StatelessWidget {
  final uid;
  const ProjectsScreen({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: MyAppBar2(),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('hackers')
            .doc(uid)
            .collection('projects')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final projects = snapshot.data!.docs;
          return ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return InkWell(
                onTap: () {
                  ProjectModel model = ProjectModel(
                      name: project['name'],
                      description: project['description'],
                      award: project['award'],
                      githubLink: project['githubLink'],
                      image: project['image'],
                      userUid: project['userUid'],
                      upvotes: project['upvotes'],
                      userName: project['userName'],
                      email: project['email'],
                      profilePicture: project['profilePicture']);

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HackScreen(model: model)));
                },
                child: HackWidget(
                    userName: project['userName'],
                    projectName: project['name'],
                    won: project['award'],
                    emailAddress: project['email'],
                    description: project['description'],
                    image: project['image'],
                    profilePicture: project['profilePicture']),
              );
            },
          );
        },
      ),
    );
  }
}
