import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_overview/pages/navigationbar/floating_action_button.dart';
import 'package:money_overview/pages/navigationbar/navigation_bar_items.dart';
import 'package:money_overview/pages/navigationbar/navigation_bar_pages.dart';
import 'package:money_overview/themes/style_templates/custom_box_decoration_style.dart';
import 'package:money_overview/widgets/view/scaffold_widget.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationBarPageState createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationPage> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: NavigationBarPages.getPages(context).elementAt(selectedIndex),
      bottomNavigationBar: Container(
          decoration: CustomBoxDecorationStyle.bottomBarBoxStyle,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(27.0),
              topRight: Radius.circular(27.0),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.white,
              selectedItemColor: const Color(0xFFa1b2c8),
              unselectedItemColor: const Color(0xFFa1b2c8).withOpacity(0.6),
              items: NavigationBarItems.getItems(context),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 25,
              currentIndex: selectedIndex,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
            ),
          )),
      floatingActionButton: FloatingActionButtonWidget.getFloatingActionButton(context),
    );
  }
}
