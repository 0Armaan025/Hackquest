import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackquest/screens/home_screen.dart';
import 'package:hackquest/utils/global_variables.dart';

import '../auth/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 2.0, top: 20, left: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/santa.png'),
                      backgroundColor: Colors.white,
                      radius: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 110.0, top: 20),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          speed: Duration(milliseconds: 100),
                          'ho-ho-ho!',
                          textStyle: GoogleFonts.nunito(
                            fontSize: 38,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: size.height * 0.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Welcome',
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 39,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'To',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Hack',
                              style: GoogleFonts.imFellDoublePica(
                                fontSize: 38,
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Quest',
                              style: GoogleFonts.imFellDoublePica(
                                fontSize: 42,
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          "\"Hack Together, Learn \nTogether!\"",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ibmPlexSansThaiLooped(
                            fontSize: 22,
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
              const SizedBox(height: 60),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => firebaseAuth.currentUser != null
                          ? HomeScreen()
                          : LoginScreen()));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: size.height * 0.08,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Continue',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 108.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
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
