import 'package:bookmark/consts/consts.dart';
import 'package:bookmark/provider/provider.dart';
import 'package:bookmark/screens/screens.dart';
import 'package:bookmark/services/services.dart';
import 'package:bookmark/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = Utils(context).getColor;

    return Drawer(
      backgroundColor:
          themeState.getDarkTheme ? darkBackgroundColor : lightBackgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    'assets/images/newspaper.png',
                    height: 60,
                    width: 60,
                  ),
                ),
                const VerticalSpacing(20),
                Flexible(
                  child: Text(
                    'News app',
                    style: GoogleFonts.lobster(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                ),
                const VerticalSpacing(20),
              ],
            ),
          ),
          const VerticalSpacing(20),
          ListTileWidget(
            color: color,
            label: 'Home',
            icon: IconlyBold.home,
            function: () {},
          ),
          ListTileWidget(
            color: color,
            label: 'Bookmark',
            icon: IconlyBold.bookmark,
            function: () {
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const BookmarkPage(),
                    inheritTheme: true,
                    ctx: context,
                  ));
            },
          ),
          const VerticalSpacing(20),
          const Divider(),
          const VerticalSpacing(20),
          SwitchListTile(
            activeColor: Colors.white,
            inactiveTrackColor: Colors.grey[300],
            inactiveThumbColor: Colors.black,
            value: themeState.getDarkTheme,
            onChanged: (bool value) {
              setState(() {
                themeState.setDarkTheme = value;
              });
            },
            title: Text(
              'Theme',
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            secondary: Icon(
              size: 20,
              themeState.getDarkTheme
                  ? Icons.dark_mode_rounded
                  : Icons.light_mode_rounded,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
