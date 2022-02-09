import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;

  const LoadingWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15,
      height: 15,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 3,
      ),
    );
  }
}
