// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:bookmark/consts/consts.dart';
import 'package:bookmark/provider/provider.dart';
import 'package:bookmark/services/services.dart';
import 'package:bookmark/widgets/widgets.dart';

class NewDetailsWebView extends StatefulWidget {
  const NewDetailsWebView({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  State<NewDetailsWebView> createState() => _NewDetailsWebViewState();
}

class _NewDetailsWebViewState extends State<NewDetailsWebView> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..enableZoom(true)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color labelColor = Utils(context).getColor;
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.url,
          style: GoogleFonts.roboto(
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
        actions: [
          IconButton(
            onPressed: () async {
              await _showModalSheetFct();
            },
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Column(
        children: [
          // LinearProgressIndicator(
          //   value: ,
          // )
          Expanded(
            child: WebViewWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showModalSheetFct() async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalSpacing(10),
              Center(
                child: Container(
                  height: 5,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Utils(context).getButtonColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const VerticalSpacing(20),
              const Text(
                'More options',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const VerticalSpacing(20),
              Divider(
                color: Utils(context).getButtonColor,
                thickness: 2,
              ),
              const VerticalSpacing(20),
              ListTileWidget(
                label: 'Share',
                icon: Icons.share,
                function: () async {
                  try {
                    Share.share(widget.url, subject: 'Look what a made');
                  } catch (err) {
                    GlobalMethods.errorDialog(
                        errorMessage: err.toString(), context: context);
                  }
                },
                color: Utils(context).getButtonColor,
              ),
              ListTileWidget(
                label: 'Open in brownse',
                icon: Icons.open_in_browser,
                function: () async {
                  if (!await launchUrl(Uri.parse(widget.url))) {
                    log('Could not launch url' as num);
                  }
                },
                color: Utils(context).getButtonColor,
              ),
              ListTileWidget(
                label: 'Refresh',
                icon: Icons.refresh,
                function: () async {
                  try {
                    controller.reload();
                  } catch (err) {
                    log("error occured $err" as num);
                  } finally {
                    Navigator.pop(context);
                  }
                },
                color: Utils(context).getButtonColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
