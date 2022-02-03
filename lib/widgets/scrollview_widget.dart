import 'package:flutter/cupertino.dart';

class ScrollViewWidget extends StatelessWidget {
  final Widget child;
  const ScrollViewWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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