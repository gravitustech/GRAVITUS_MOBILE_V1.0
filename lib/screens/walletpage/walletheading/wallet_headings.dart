// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gravitus_app_v1/providers/bussinesslogic.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletheading/depositscreen/deposit_bottomsheet.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletheading/depositscreen/deposite_coinaddress_bottomsheet.dart';

import 'package:provider/provider.dart';

import '../../../styles/styles.dart';
import 'withdrawscreen/withdraw_coinpage.dart';

class WalletHead extends StatefulWidget {
  const WalletHead({Key key}) : super(key: key);

  @override
  State<WalletHead> createState() => _WalletHeadState();
}

class _WalletHeadState extends State<WalletHead> {
  bool bottomItemClicked = false;
  _handleBottomSheet() {
    setState(() {
      Provider.of<Bussinesslogic>(context, listen: false).clickDeposit();
      bottomItemClicked = !bottomItemClicked;
    });
  }

//we can use the Consumer widget, that will call Provider.of with its own BuildContext(builder),
  _showBottom() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (BuildContext context) {
          return Consumer<Bussinesslogic>(
              builder: (context, walletProvider, child) {
            return bottomItemClicked
                ? DepositCoinAddressBottomSheet()
                : DepositeBottomSheet(
                    onTap: () {
                      _handleBottomSheet();
                    },
                  );
          });
        }).whenComplete(() => bottomItemClicked = false);
  }

  _showBottomWithdraw() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (BuildContext context) {
          return Consumer<Bussinesslogic>(
              builder: (context, walletProvider, child) {
            return bottomItemClicked
                ? WithdrawCoin()
                : DepositeBottomSheet(
                    onTap: () {
                      _handleBottomSheet();
                    },
                  );
          });
        }).whenComplete(() => bottomItemClicked = false);
  }

  @override
  Widget build(BuildContext context) {
    // final UserName = 52.of<String>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xff4783EF)),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: TextButton(
              onPressed: () {
                _showBottom();
              },
              child: Text('Deposit', style: headingstyle),
            ),
          ),
          //next
          Padding(
            padding: EdgeInsets.all(10),
            child: VerticalDivider(
              color: Color(0xff6EA2FF),
              thickness: 1,
            ),
          ),
          //next
          Flexible(
            fit: FlexFit.tight,
            child: TextButton(
              onPressed: () {
                _showBottomWithdraw();
              },
              child: Text('Withdraw', style: headingstyle),
            ),
          ),
          //next
          Padding(
            padding: EdgeInsets.all(10),
            child: VerticalDivider(
              color: Color(0xff6EA2FF),
              thickness: 1,
            ),
          ),
          //next
          Flexible(
            fit: FlexFit.tight,
            child: TextButton(
              onPressed: null,
              child: Text('History', style: headingstyle),
            ),
          ),
        ],
      ),
    );
  }
}
