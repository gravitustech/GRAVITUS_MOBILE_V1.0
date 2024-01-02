import 'package:flutter/material.dart';

class MarketCoinsTitle extends StatefulWidget {
  const MarketCoinsTitle({Key key}) : super(key: key);

  @override
  State<MarketCoinsTitle> createState() => _CoinsTitleState();
}

class _CoinsTitleState extends State<MarketCoinsTitle> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'Name',
        style: TextStyle(
            fontSize: 12,
            color: Color(0xffB1B1B1),
            fontWeight: FontWeight.w500),
      ),
      trailing: Wrap(
        spacing: 42,
        children: const [
          Text(
            'Market Price',
            style: TextStyle(
                fontSize: 12,
                color: Color(0xffB1B1B1),
                fontWeight: FontWeight.w500),
          ),
          Text(
            'changes%',
            style: TextStyle(
                fontSize: 12,
                color: Color(0xffB1B1B1),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
