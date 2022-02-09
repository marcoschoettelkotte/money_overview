import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_overview/themes/style_templates/custom_box_decoration_style.dart';
import 'package:money_overview/themes/style_templates/custom_text_style.dart';

class WelcomeWidget extends StatelessWidget {
  final String username = 'Marco';

  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFf7c35a),
                radius: 29,
                child: Icon(
                  FontAwesomeIcons.solidUser,
                  color: Colors.white,
                  size: 27,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome!',
                      style: CustomTextStyle.subHeader1Text,
                    ),
                    Text(
                      username,
                      style: CustomTextStyle.header1Text,
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            decoration: CustomBoxDecorationStyle.whiteRoundedBoxStyle,
            child: IconButton(
                padding: const EdgeInsets.all(3),
                onPressed: () {},
                icon: const Icon(
                  Icons.settings_rounded,
                  color: Color(0xFFa1b1c8),
                  size: 25,
                )),
          )
        ],
      ),
    );
  }
}
