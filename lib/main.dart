// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gravitus_app_v1/dashboard/dashboard.dart';
import 'package:gravitus_app_v1/providers/bussinesslogic.dart';
import 'package:provider/provider.dart';
import 'providers/getitpackage.dart' as di;
//di usage getit packages no need to this dart file

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //flutterapp portrait & landscape code
  ]);
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<Bussinesslogic>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gravitus',
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => DashboardScreen(),
      //   '/first': (context) => HomeScreen(),
      //   '/second': (context) => MarketScreen(),
      //   '/third': (context) => TradeScreen('BTC/USTD'),
      //   '/fourth': (context) => WalletScreen(),
      // },
    );
  }
}
