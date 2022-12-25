import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackquest/auth/screens/signup_screen.dart';
import 'package:hackquest/controllers/auth_controller.dart';
import 'package:hackquest/main.dart';
import 'package:hackquest/utils/global_variables.dart';
import 'package:hackquest/utils/widgets/my_app_bar.dart';
import 'package:hackquest/utils/widgets/text_field_form.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void logIn(BuildContext context) {
    AuthController()
        .logIn(emailController.text, passwordController.text, context);
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
                'Login',
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
              'We are happy to see you back!',
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
                                    builder: (context) => SignUpScreen())),
                            child: Text(
                              'New To $appName?',
                              style: TextStyle(color: Colors.blue[800]),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      InkWell(
                        onTap: () {
                          logIn(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          width: double.infinity,
                          height: size.height * 0.06,
                          alignment: Alignment.center,
                          child: Text(
                            'Log In',
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
