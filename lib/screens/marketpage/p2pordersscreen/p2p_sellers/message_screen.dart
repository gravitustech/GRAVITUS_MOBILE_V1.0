// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart'; //chat packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<types.Message> _messages = [];

  final _user = types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: SvgPicture.asset('images/backicon1.svg'),
        //   tooltip: 'Back',
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        leadingWidth: 30,
        backgroundColor: Color(0xff2A6DE6),
        title: Text('Chat'),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff),
        ),
      ),
      body: Chat(
        theme: DefaultChatTheme(
          backgroundColor: Color(0xffffffff),
          inputBackgroundColor: Color(0xffF5F5F5),
          inputBorderRadius: BorderRadius.all(Radius.circular(20)),
          inputMargin: EdgeInsets.all(10),
          inputPadding: EdgeInsets.all(15),
          inputTextColor: Color(0xff808080),
          inputTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          sendButtonIcon: SvgPicture.asset('images/sendmgs.svg'),
          attachmentButtonIcon: SvgPicture.asset('images/imageicon.svg'),
          sentMessageBodyTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffffffff),
          ),
          receivedMessageBodyTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff808080),
          ),
          primaryColor: Color(0xff2A6DE6),
          secondaryColor: Color(0xffF8F8F8),
        ),
        showUserAvatars: true,
        showUserNames: true,
        messages: _messages,
        user: _user,
        onSendPressed: _handleSendPressed,
        onAttachmentPressed: _handleImageSelection,
        onMessageTap: null,
        onPreviewDataFetched: null,
      ),
    );
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }
}
