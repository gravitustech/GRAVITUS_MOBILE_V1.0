import 'package:flutter/material.dart';

class Greenorderbook extends StatefulWidget {
  const Greenorderbook({
    Key key,
    home,
    required,
    this.child,
  }) : super(key: key);
  final String child;

  @override
  State<Greenorderbook> createState() => _GreenorderbookState();
}

// ignore: camel_case_types
class _GreenorderbookState extends State<Greenorderbook> {
  //Color _colorContainer = Color.fromARGB(255, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [
            0.3, // percentage value 0.5 = 50%
            0.01,
          ],
          colors: [
            // the color you need to fill,
            Colors.white,
            Color(0x2600BBAB), //container base color
          ],
        ),
      ),
      height: 24,
      //  color: Color(0x2600BBAB),
      child: Row(
        children: const [
          Text(
            '100',
            style: TextStyle(
                fontSize: 8,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
          Expanded(child: SizedBox()),
          Text(
            '0.001',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 8, color: Color(0xFF00BBAB)),
          ),
        ],
      ),
    );
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
