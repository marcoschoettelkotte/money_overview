import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_overview/pages/add/add_page.dart';
import 'package:money_overview/themes/style_templates/custom_box_decoration_style.dart';

class FloatingActionButtonWidget {
  static Widget getFloatingActionButton(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPage()));
          },
          backgroundColor: Colors.transparent,
          elevation: 10,
          highlightElevation: 14,
          enableFeedback: false,
          child: Container(
            width: 64,
            height: 64,
            decoration: CustomBoxDecorationStyle.colorfulGradientCircleBoxStyle,
            child: const Icon(
              Icons.add_rounded,
              size: 44,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
