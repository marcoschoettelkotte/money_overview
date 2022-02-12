import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    return Scaffold(
        backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
        bottomNavigationBar: bottomNavigationBar,
        appBar: appBar ??
            AppBar(
              toolbarHeight: 0,
              elevation: 0,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
            ),
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
