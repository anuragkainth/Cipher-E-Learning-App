import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class CoursePageSubheading extends StatelessWidget {
  const CoursePageSubheading({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 13.0),
      child: Text(
        text,
        style: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
      ),
    );
  }
}