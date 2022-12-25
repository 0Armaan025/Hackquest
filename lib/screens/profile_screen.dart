import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackquest/screens/projects_screen.dart';
import 'package:network_image_safe_provider/_network_image_safe_provider_io.dart';

import '../models/hacker_model.dart';
import '../utils/global_variables.dart';
import '../utils/widgets/my_app_bar_2.dart';

class ProfileScreen extends StatefulWidget {
  final model;
  const ProfileScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        child: MyAppBar2(),
        preferredSize: Size(double.infinity, kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    widget.model.profilePicture,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  widget.model.name,
                  style: GoogleFonts.robotoMono(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(widget.model.email,
                  style: GoogleFonts.alata(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  )),
              const SizedBox(height: 2),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    elevation: 2.0,
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.04,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/images/hacker.png'),
                            radius: 10,
                          ),
                          Container(
                            width: 10,
                          ),
                          Text('Hacker')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Card(
                  elevation: 2.0,
                  child: Container(
                    height: size.height * 0.06,
                    width: double.infinity,
                    // margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProjectsScreen(uid: widget.model.uid)),
                        );
                      },
                      child: ListTile(
                        leading: Icon(Icons.list_alt),
                        title: Text('View Projects'),
                      ),
                    ),
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
