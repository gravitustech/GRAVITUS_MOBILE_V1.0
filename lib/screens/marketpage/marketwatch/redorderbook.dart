import 'package:flutter/material.dart';

class Redorderbook extends StatefulWidget {
  const Redorderbook({
    Key key,
    home,
    required,
    this.child,
  }) : super(key: key);
  final String child;

  @override
  State<Redorderbook> createState() => _RedorderbookState();
}

class _RedorderbookState extends State<Redorderbook> {
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
              Color(0x26FF5E3B), //container base color
            ],
          ),
        ),
        height: 24,
        //  color: Color(0x26FF5E3B),
        child: Row(
          children: const [
            Text(
              '0.0012',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 8, color: Color(0xFFFF5E3B)),
            ),
            Expanded(child: SizedBox()),
            Text(
              '100',
              style: TextStyle(
                  fontSize: 8,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            )
          ],
        ));
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
