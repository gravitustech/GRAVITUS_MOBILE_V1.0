// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/providers/bussinesslogic.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletheading/depositscreen/deposit_bottomsheet.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletheading/depositscreen/deposite_coinaddress_bottomsheet.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletheading/withdrawscreen/withdraw_coinpage.dart';
import 'package:gravitus_app_v1/styles/styles.dart';
import 'package:provider/provider.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({Key key}) : super(key: key);

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  bool bottomItemClicked = false;
  _handleBottomSheet() {
    setState(() {
      Provider.of<Bussinesslogic>(context, listen: false).clickDeposit();
      bottomItemClicked = !bottomItemClicked;
    });
  }

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                TextButton(
                    onPressed: () {
                      _showBottom();
                    },
                    child: SvgPicture.asset('images/grid7.svg', width: 35)),
                const Text('Deposit', style: homecategoriesstyle)
              ]),
              Column(children: [
                TextButton(
                    onPressed: () {
                      _showBottomWithdraw();
                    },
                    child: SvgPicture.asset('images/grid2.svg', width: 35)),
                Text('Withdraw', style: homecategoriesstyle)
              ]),
              Column(children: [
                TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset('images/grid3.svg', width: 35)),
                Text('History', style: homecategoriesstyle)
              ]),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset('images/grid4.svg', width: 35)),
                Text('P2P Orders', style: homecategoriesstyle)
              ]),
              Column(children: [
                TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset('images/grid5.svg', width: 35)),
                Text('P2P Listings', style: homecategoriesstyle)
              ]),
              Column(children: [
                TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset('images/grid6.svg', width: 35)),
                Text('Helpline', style: homecategoriesstyle)
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
