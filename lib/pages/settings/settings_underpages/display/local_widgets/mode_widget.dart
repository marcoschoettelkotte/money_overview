import 'package:flutter/material.dart';

class ModeWidget extends StatelessWidget {
  final bool isDark;
  const ModeWidget({Key? key, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color1 = isDark ? Color(0xFF181B2C) : Color(0xFFC6DBEE);
    Color color2 = isDark ? Color(0xFF22263C) : Color(0xFF99BDE1);
    Color color3 = isDark ? Color(0xFF343958) : Color(0xFF749FD7);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Container(
        decoration: BoxDecoration(color: color1, borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                width: 100,
                height: 55,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: color2,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: color3,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                width: 60,
                                height: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: color3,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: color3,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              width: 60,
                              height: 10,
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: color3),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 6,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                  color: color2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
