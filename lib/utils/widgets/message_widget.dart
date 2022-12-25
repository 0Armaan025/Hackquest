import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageWidget extends StatelessWidget {
  final String userName;
  final String message;
  final String profilePicture;
  const MessageWidget(
      {Key? key,
      required this.userName,
      required this.message,
      required this.profilePicture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4,
      ),
      child: Container(
        width: double.infinity,
        height: size.height * 0.06,
        decoration: BoxDecoration(
          color: Colors.blue[100],
          border: Border.all(
            color: Colors.black,
          ),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                '$userName:\t',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                message,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
