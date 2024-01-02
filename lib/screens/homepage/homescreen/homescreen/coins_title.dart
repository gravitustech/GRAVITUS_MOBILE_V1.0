import 'package:flutter/material.dart';

class CoinsTitle extends StatefulWidget {
  const CoinsTitle({Key key}) : super(key: key);

  @override
  State<CoinsTitle> createState() => _CoinsTitleState();
}

class _CoinsTitleState extends State<CoinsTitle> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'Pair',
        style: TextStyle(
            fontSize: 12,
            color: Color(0xffB1B1B1),
            fontWeight: FontWeight.w600),
      ),
      trailing: Wrap(
        spacing: 50,
        children: const [
          Text(
            'Last Price',
            style: TextStyle(
                fontSize: 12,
                color: Color(0xffB1B1B1),
                fontWeight: FontWeight.w600),
          ),
          Text(
            '24h chg%',
            style: TextStyle(
                fontSize: 12,
                color: Color(0xffB1B1B1),
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
