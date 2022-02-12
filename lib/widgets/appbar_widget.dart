import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatelessWidget {
  final Widget? title;

  const AppBarWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title ?? Container(),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.times,
                color: Theme.of(context).buttonColor,
              ),
              onPressed: () => Navigator.pop(context)),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
