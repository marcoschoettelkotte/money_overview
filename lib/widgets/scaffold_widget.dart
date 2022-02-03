import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final Color statusBarColor;
  final BottomNavigationBar? bottomNavigationBar;
  final AppBar? appBar;
  final bool? hasPadding;

  const ScaffoldWidget(
      {Key? key,
      required this.body,
      required this.backgroundColor,
      required this.statusBarColor,
      this.bottomNavigationBar,
      this.appBar,
      this.hasPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor, // status bar color
    ));
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        body: Padding(
          padding: hasPadding == null || hasPadding == true
              ? EdgeInsets.only(top: MediaQuery.of(context).padding.top)
              : const EdgeInsets.all(0),
          child: body,
        ));
  }
}
