import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScrollViewWidget extends StatelessWidget {
  final Widget child;

  const ScrollViewWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        statusBarBrightness: Brightness.light));
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: child,
        ));
  }
}
