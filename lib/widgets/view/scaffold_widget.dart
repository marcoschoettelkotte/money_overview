import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget body;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final bool? hasPadding;

  const ScaffoldWidget(
      {Key? key,
      required this.body,
      this.backgroundColor,
      this.appBar,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.hasPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent, systemStatusBarContrastEnforced: true));
    return Scaffold(
        backgroundColor: backgroundColor ?? const Color(0xFFf3f4f6),
        bottomNavigationBar: bottomNavigationBar,
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: hasPadding == null || hasPadding == true
              ? EdgeInsets.only(top: MediaQuery.of(context).padding.top)
              : const EdgeInsets.all(0),
          child: body,
        ));
  }
}
