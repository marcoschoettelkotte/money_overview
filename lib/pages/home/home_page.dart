import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_overview/widgets/scaffold_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        body: const Text("hi"),
        backgroundColor: Theme.of(context).accentColor,
        statusBarColor: Colors.transparent);
  }
}
