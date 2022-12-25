import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackquest/models/hacker_model.dart';
import 'package:hackquest/models/project_model.dart';
import 'package:hackquest/utils/global_variables.dart';
import 'package:hackquest/utils/widgets/my_app_bar_2.dart';
import 'package:hackquest/utils/widgets/text_field_form.dart';

import 'confirmation_screen.dart';

class AddProjectScreen extends StatefulWidget {
  AddProjectScreen({Key? key}) : super(key: key);

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController projectDescriptionController =
      TextEditingController();
  final TextEditingController projectGithubLinkController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    projectNameController.dispose();
    projectDescriptionController.dispose();
    projectGithubLinkController.dispose();
  }

  ProjectModel? model;
  void addProject() {
    model = ProjectModel(
        userName: firebaseAuth.currentUser?.displayName ?? '',
        email: firebaseAuth.currentUser?.email ?? '',
        name: projectNameController.text,
        profilePicture: '',
        description: projectDescriptionController.text,
        award: false,
        githubLink: projectGithubLinkController.text,
        image: '',
        userUid: firebaseAuth.currentUser?.uid ?? '',
        upvotes: '0');

    init(model!);
  }

  void init(ProjectModel model) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ConfirmationScreen(model: model)));
  }

  @override
  Widget build(BuildContext context) {
    bool won = false;

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
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Add your project to $appName",
                  style: GoogleFonts.homenaje(
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "Let\'s inspire hackers!",
                  style: GoogleFonts.hindMadurai(
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFieldForm(
                    labelText: 'Enter project name',
                    prefixIcon: Icon(Icons.person),
                    maxLength: 20,
                    maxLines: 1,
                    isObscure: false,
                    textController: projectNameController),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFieldForm(
                    labelText: 'Enter project description',
                    prefixIcon: Icon(Icons.notes),
                    maxLength: 200,
                    isObscure: false,
                    maxLines: 50,
                    textController: projectDescriptionController),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFieldForm(
                    labelText: 'Enter project\'s github link',
                    prefixIcon: Icon(Icons.link),
                    maxLength: 30,
                    isObscure: false,
                    maxLines: 1,
                    textController: projectGithubLinkController),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: size.height * 0.3,
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: imageFile == null
                    ? IconButton(
                        icon: Icon(
                          Icons.upload,
                          color: Colors.blue,
                          size: 40,
                        ),
                        onPressed: () {
                          pickImage(context);
                          setState(() {});
                        },
                      )
                    : Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Row(
                          children: [
                            Container(
                              height: 210,
                              width: 200,
                              margin: const EdgeInsets.all(4),
                              child: Image(
                                image: FileImage(imageFile!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.deepPurple,
                                size: 30,
                              ),
                              onPressed: () {
                                pickImage(context);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  // init();
                },
                child: InkWell(
                  onTap: () {
                    addProject();
                  },
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.07,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Add Project',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
