import 'package:bookmark/consts/consts.dart';
import 'package:bookmark/provider/provider.dart';
import 'package:bookmark/services/services.dart';
import 'package:bookmark/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color labelColor = Utils(context).getColor;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Bookmarks',
            style: GoogleFonts.lobster(
              textStyle: TextStyle(
                color: labelColor,
                fontSize: 22,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.6,
              ),
            ),
          ),
          backgroundColor:
              themeState.getDarkTheme ? darkScaffoldColor : lightScaffoldColor,
          // foregroundColor: color,
          iconTheme: IconThemeData(color: labelColor),
          elevation: 0,
        ),
        body: const EmptyWidget(
            message: 'You didn\'t add anything yet to your bookmarks',
            imagePath: 'assets/images/bookmark.png')
        //  ListView.builder(
        //   itemBuilder: (context, index) {
        //     return const ArticlesWidget();
        //   },
        //   itemCount: 10,
        // ),
        );
  }
}
