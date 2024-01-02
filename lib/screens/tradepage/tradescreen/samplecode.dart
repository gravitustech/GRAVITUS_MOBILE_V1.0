// import 'package:flutter/material.dart';

// class Samplecode extends StatefulWidget {
//   const Samplecode({Key key}) : super(key: key);

//   @override
//   State<Samplecode> createState() => _SamplecodeState();
// }

// class _SamplecodeState extends State<Samplecode> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
// import 'dart:convert';
// import 'package:crypto/crypto.dart';

// class Block {
//   int index;
//   String timestamp;
//   Map<String, dynamic> data;
//   String previousHash;
//   String hash;

//   Block({this.index, this.timestamp, this.data, this.previousHash});

//   void calculateHash() {
//     var dataToHash = jsonEncode({
//       'index': index,
//       'timestamp': timestamp,
//       'data': data,
//       'previousHash': previousHash
//     });
//     hash = sha256.convert(utf8.encode(dataToHash)).toString();
//   }
// }

// class Blockchain {
//   List<Block> _chain = List<Block>();

//   Blockchain() {
//     _chain.add(createGenesisBlock());
//   }

//   Block createGenesisBlock() {
//     return Block(
//         index: 0,
//         timestamp: DateTime.now().toString(),
//         data: {'genesis': 'block'},
//         previousHash: '0');
//   }

//   Block getLatestBlock() {
//     return _chain.last;
//   }

//   void addBlock(Block newBlock) {
//     newBlock.previousHash = getLatestBlock().hash;
//     newBlock.calculateHash();
//     _chain.add(newBlock);
//   }

//   List<Block> getChain() {
//     return _chain;
//   }
// }
 