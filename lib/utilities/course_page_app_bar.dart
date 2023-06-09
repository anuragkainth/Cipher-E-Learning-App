import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  MyAppBar({
    Key? key,
    required this.title,
    required this.isDarkMode,
    required this.onToggleTheme,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: !isDarkMode ? Colors.white : null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                kCipherSchoolsIcon,
                scale: 8,
              ),
              SizedBox(width: 10,),// Replace with company icon
              Text(title, style:  GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  )
              ),),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(isDarkMode ? FontAwesomeIcons.moon : FontAwesomeIcons.sun, color: Colors.black,),
                onPressed: onToggleTheme,
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black,),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search, color: Colors.black,),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}