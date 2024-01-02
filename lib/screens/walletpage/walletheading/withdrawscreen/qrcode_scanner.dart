// // ignore_for_file: prefer_const_constructors, sort_child_properties_last

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'dart:developer';
// import 'dart:io';

// class QrScanScreen extends StatefulWidget {
//   const QrScanScreen({Key key}) : super(key: key);

//   @override
//   State<QrScanScreen> createState() => _QrScanScreenState();
// }

// class _QrScanScreenState extends State<QrScanScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController controller;
//   Barcode barcode;
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   @override
//   void reassemble() async {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       await controller.pauseCamera();
//     }
//     controller.resumeCamera();
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//       controller?.resumeCamera();
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         barcode = scanData;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(child: buildQrView(context)),
//           Positioned(bottom: 10, child: buildResult()),
//           Positioned(top: 10, child: buildControlButtons()),
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Expanded(
//                   child: ElevatedButton(
//                 child: Text('Button'),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Color(0xffFFFFFF),
//                   backgroundColor: Color(0XFF2A6DE6),
//                 ),
//               ))
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   //
//   Widget buildControlButtons() => Container(
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.white24,
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             IconButton(
//               onPressed: () async {
//                 await controller?.toggleFlash();
//                 setState(() {});
//               },
//               icon: FutureBuilder<bool>(
//                   future: controller?.getFlashStatus(),
//                   builder: (context, snapshot) {
//                     if (snapshot.data != null) {
//                       return Icon(
//                           snapshot.data ? Icons.flash_on : Icons.flash_off);
//                     } else {
//                       return Icon(Icons.flash_off);
//                     }
//                   }),
//             ),
//             IconButton(
//               onPressed: () async {
//                 await controller?.flipCamera();
//                 setState(() {});
//               },
//               icon: FutureBuilder(
//                   future: controller?.getCameraInfo(),
//                   builder: (context, snapshot) {
//                     if (snapshot.data != null) {
//                       return Icon(Icons.switch_camera);
//                     } else {
//                       return Icon(Icons.switch_camera);
//                     }
//                   }),
//             ),
//           ],
//         ),
//       );

//   //
//   Widget buildResult() => Container(
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//         ),
//         child: Text(
//           barcode != null ? 'Result:${barcode.code}' : 'Scan a barcode',
//         ),
//       );

//   //
//   Widget buildQrView(BuildContext context) => QRView(
//         key: qrKey,
//         onQRViewCreated: _onQRViewCreated,
//         overlay: QrScannerOverlayShape(
//           borderColor: Colors.red,
//           borderLength: 20,
//           borderWidth: 10,
//           borderRadius: 10,
//           cutOutSize: MediaQuery.of(context).size.width * 0.8,
//         ),
//       );
// }
