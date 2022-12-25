import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackquest/models/project_model.dart';
import 'package:hackquest/screens/home_screen.dart';
import 'package:hackquest/utils/global_variables.dart';
import 'package:hackquest/utils/widgets/my_app_bar_2.dart';

class ConfirmationScreen extends StatefulWidget {
  final ProjectModel model;

  const ConfirmationScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  bool won = false;

  String userName = "";
  String profilePicture = "";

  void continueProcess() async {
    Reference reference =
        firebaseStorage.ref('projectPictures/${widget.model.name}');
    UploadTask uploadTask = reference.putFile(imageFile!);
    final storageSnapshot = uploadTask.snapshot;
    final downloadUrl = await storageSnapshot.ref.getDownloadURL();
    print('download url is $downloadUrl');

    var field;

    // Get the document snapshot

    if (widget.model.name.isEmpty ||
        widget.model.githubLink.isEmpty ||
        widget.model.description.isEmpty ||
        imageFile == null) {
      showSnackBar(context, 'All the fields must be filled!');
    }

    ProjectModel newModel = ProjectModel(
        name: widget.model.name,
        userName: userName,
        profilePicture: profilePicture,
        email: firebaseAuth.currentUser?.email ?? '',
        description: widget.model.description,
        award: won,
        githubLink: widget.model.githubLink,
        image: downloadUrl,
        userUid: widget.model.userUid,
        upvotes: widget.model.upvotes);

    print(newModel.name);

    firestore.collection('projects').doc(newModel.name).set(newModel.toMap());
    firestore
        .collection('hackers')
        .doc(firebaseAuth.currentUser?.uid ?? '')
        .collection('projects')
        .doc(newModel.name)
        .set(newModel.toMap());
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void getData() {
    var data = firestore
        .collection('hackers')
        .doc(firebaseAuth.currentUser?.uid ?? '')
        .get()
        .then((DocumentSnapshot snapshot) {
      userName = snapshot.get('name');
      profilePicture = snapshot.get('profilePicture');

      print(userName);
      print(profilePicture);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: MyAppBar2(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 5),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'Last Step',
                    style: GoogleFonts.jaldi(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Did your project win any award?',
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: size.height * 0.17,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        won = true;
                        setState(() {
                          won = true;
                        });
                      },
                      child: Container(
                        height: size.height * 0.1,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                          color:
                              won == true ? Colors.blue[500] : Colors.blue[300],
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            won = true;
                            print(won);
                            showSnackBar(context, 'Won selected');
                            setState(() {
                              won = true;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                    ),
                    InkWell(
                      onTap: () {
                        won = false;
                        print(won);
                        setState(() {
                          won = false;
                        });
                      },
                      child: Container(
                        height: size.height * 0.1,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                          color: won == false
                              ? Colors.blue[500]
                              : Colors.blue[300],
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            won = false;
                            print(won);
                            showSnackBar(context, 'Won deselected');
                            setState(() {
                              won = false;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  continueProcess();
                },
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.09,
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Continue',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 32,
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
