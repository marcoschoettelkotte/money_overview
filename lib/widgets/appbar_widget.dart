import 'package:flutter/material.dart';
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
              icon: const Icon(
                FontAwesomeIcons.times,
                color: Color(0xFFa1b1c8),
              ),
              onPressed: () => Navigator.pop(context)),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
