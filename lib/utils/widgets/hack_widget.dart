import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HackWidget extends StatelessWidget {
  final userName;
  final projectName;
  final won;
  final emailAddress;
  final description;
  final profilePicture;
  final image;
  const HackWidget(
      {Key? key,
      required this.userName,
      required this.projectName,
      required this.won,
      required this.emailAddress,
      required this.description,
      required this.image,
      required this.profilePicture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: size.height * 0.35,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(profilePicture),
                  ),
                ),
                Container(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      '$userName',
                      style: GoogleFonts.ibmPlexSansHebrew(
                        color: Colors.black,
                      ),
                    ),
                    Text('$emailAddress',
                        style: GoogleFonts.ibmPlexSansHebrew(
                          color: Colors.black,
                        )),
                  ],
                ),
                Container(
                  width: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Image(
                    image: NetworkImage('$image'),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 10,
                ),
              ],
            ),
            Divider(
              height: 10,
              color: Colors.black,
              thickness: 1,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Project:-\t$projectName",
                          style: GoogleFonts.lato(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 60,
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  height: 39,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: won == true ? Colors.blue[200] : Colors.grey[300],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${won == true ? 'WON' : ''}',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 10,
              color: Colors.black,
              thickness: 1,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        '$description',
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
