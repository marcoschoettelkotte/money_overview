import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_overview/pages/add/local_widgets/add_form.dart';
import 'package:money_overview/widgets/appbar_widget.dart';
import 'package:money_overview/widgets/view/scaffold_widget.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        body: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const AppBarWidget(),
          AddFormWidget(scrollController: _scrollController),
        ],
      ),
    ));
  }
}
