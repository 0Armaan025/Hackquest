import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackquest/auth/screens/login_screen.dart';
import 'package:hackquest/controllers/auth_controller.dart';
import 'package:hackquest/main.dart';
import 'package:hackquest/models/hacker_model.dart';
import 'package:hackquest/utils/global_variables.dart';
import 'package:hackquest/utils/widgets/my_app_bar.dart';
import 'package:hackquest/utils/widgets/text_field_form.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    ageController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
  }

  void signUp(BuildContext context) {
    if (passwordController.text != confirmPasswordController.text) {
      showSnackBar(context, "Passwords do not match!");
    }

    HackerModel model = HackerModel(
        name: nameController.text,
        uid: firebaseAuth.currentUser?.uid ?? '',
        phoneNumber: phoneNumberController.text,
        email: emailController.text,
        password: passwordController.text,
        profilePicture: '',
        age: ageController.text,
        totalProjects: '0');

    AuthController().signUp(model, context, imageFile!);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        child: MyAppBar(),
        preferredSize: Size(double.infinity, kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                'Sign Up',
                style: GoogleFonts.hanuman(
                  fontSize: 40,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'We are happy to welcome new hackers!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                elevation: 2.0,
                child: Container(
                  color: Colors.grey[100],
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            imageFile == null
                                ? CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/hacker.png'),
                                    radius: 50,
                                  )
                                : CircleAvatar(
                                    backgroundImage: FileImage(imageFile!),
                                    radius: 50,
                                  ),
                            Positioned(
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.deepPurple,
                                ),
                                onPressed: () async {
                                  pickImage(context);
                                  setState(() {});
                                },
                              ),
                              left: 60,
                              top: 58,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFieldForm(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Enter your Name',
                            isObscure: false,
                            maxLength: 30,
                            textController: nameController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFieldForm(
                            prefixIcon: Icon(Icons.numbers),
                            labelText: 'Enter your Age',
                            isObscure: false,
                            maxLength: 2,
                            textController: ageController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFieldForm(
                            prefixIcon: Icon(Icons.phone),
                            labelText: 'Enter your Phone Number',
                            isObscure: false,
                            maxLength: 10,
                            textController: phoneNumberController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFieldForm(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Enter your email',
                            isObscure: false,
                            maxLength: 30,
                            textController: emailController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFieldForm(
                            prefixIcon: Icon(Icons.password),
                            labelText: 'Enter your password',
                            isObscure: true,
                            maxLength: 16,
                            textController: passwordController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFieldForm(
                            prefixIcon: Icon(Icons.password),
                            labelText: 'Confirm your password',
                            isObscure: true,
                            maxLength: 16,
                            textController: confirmPasswordController),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen())),
                            child: Text(
                              'Already a User?',
                              style: TextStyle(color: Colors.blue[800]),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          signUp(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          width: double.infinity,
                          height: size.height * 0.06,
                          alignment: Alignment.center,
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.mPlus1(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue[500],
                            border: Border.all(
                              color: Colors.black,
                            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
