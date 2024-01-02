// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Actor {
  const Actor(
    this.name,
  );
  final String name;
}

class CastList extends StatefulWidget {
  const CastList({
    Key key,
  }) : super(key: key);

  @override
  State createState() => CastListState();
}

class CastListState extends State<CastList> {
  final List<Actor> _cast = <Actor>[
    Actor(''),
  ];

  Iterable<Widget> get actorWidgets => _cast.map((Actor message) {
        return Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16),
          child: InkWell(
            onTap: null,
            child: Chip(
              deleteButtonTooltipMessage: 'Remove',
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              deleteIcon: SvgPicture.asset('images/chat_close.svg'),
              elevation: 0,
              deleteIconColor: Color(0xffffffff),
              backgroundColor: Color(0xff4783EF),
              label: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16, left: 16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Lorem ipsum dolor sit amet.',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '07 June, 09:16 Am',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              onDeleted: () {
                setState(() {
                  _cast.removeWhere((Actor entry) {
                    return entry.name == message.name;
                  });
                });
              },
            ),
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: actorWidgets.toList(),
    );
  }
}

class LastMessage1 extends StatefulWidget {
  const LastMessage1({Key key}) : super(key: key);

  @override
  State<LastMessage1> createState() => _LastMessage1State();
}

class _LastMessage1State extends State<LastMessage1> {
  @override
  Widget build(BuildContext context) {
    return CastList();
  }
}

//
class LastMessage extends StatefulWidget {
  const LastMessage({Key key}) : super(key: key);

  @override
  State<LastMessage> createState() => _LastMessageState();
}

bool remove = true;

class _LastMessageState extends State<LastMessage> {
  @override
  Widget build(BuildContext context) {
    return remove != false
        ? Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: InkWell(
              onTap: null,
              child: Chip(
                deleteButtonTooltipMessage: 'Remove',
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                deleteIcon: SvgPicture.asset('images/chat_close.svg'),
                elevation: 0,
                deleteIconColor: Color(0xffffffff),
                backgroundColor: Color(0xff4783EF),
                label: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, bottom: 16, left: 16),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Lorem ipsum dolor sit amet.',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '07 June, 09:16 Am',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                onDeleted: () {
                  setState(() {
                    remove = false;
                  });
                },
              ),
            ),
          )
        : SizedBox();
  }
}
