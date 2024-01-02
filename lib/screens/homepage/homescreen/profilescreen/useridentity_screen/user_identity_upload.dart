// ignore_for_file: non_constant_identifier_names, prefer_final_fields, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/styles/styles.dart';
import 'package:gravitus_app_v1/textfields/withdraw_textfield.dart';
import 'package:image_picker/image_picker.dart'; //image picker dependicy
import 'package:image_cropper/image_cropper.dart';

class UserIdentityUpload extends StatefulWidget {
  const UserIdentityUpload({Key key}) : super(key: key);

  @override
  State<UserIdentityUpload> createState() => _UserIdentityUploadState();
}

class _UserIdentityUploadState extends State<UserIdentityUpload> {
  TextEditingController _pan_name_Controller = TextEditingController();
  TextEditingController _pan_number_Controller = TextEditingController();

  FocusNode _pan_name_Node = FocusNode();
  FocusNode _pan_number_Node = FocusNode();

  String _dropDownValue;
  String identiryType = 'identityType';

  // ignore: avoid_init_to_null
  CroppedFile _croppedFile = null;
  // ignore: avoid_init_to_null
  List<XFile> _imageFileList = null;

  final ImagePicker _picker = ImagePicker();

  //pickupImage
  void _pickImage() async {
    final XFile image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _setImageFile(image);
    });
  }

  void _setImageFile(XFile value) {
    _imageFileList = value == null ? null : <XFile>[value];
    _cropImage();
  }

  Future<void> _cropImage() async {
    if (_imageFileList != null) {
      final croppedFile = await ImageCropper().cropImage(
          sourcePath: _imageFileList[0].path,
          compressFormat: ImageCompressFormat.jpg,
          compressQuality: 100,
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Crop Image',
                statusBarColor: Color(0xff2A6DE6),
                toolbarColor: Color(0xff2A6DE6),
                activeControlsWidgetColor: Color(0xff2A6DE6),
                toolbarWidgetColor: Color(0xffFFFFFF),
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            IOSUiSettings(title: 'Crop Image'),
            WebUiSettings(
              context: context,
              presentStyle: CropperPresentStyle.dialog,
              boundary: CroppieBoundary(
                height: 520,
                width: 520,
              ),
              viewPort: CroppieViewPort(
                height: 480,
                width: 480,
                type: 'circle',
              ),
              enableExif: true,
              enableZoom: true,
              showZoomer: true,
            )
          ]);
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leadingWidth: 30,
                title: Text(
                  'User Identity',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: Color(0xff2A6DE6),
              ),
              //next
              SliverToBoxAdapter(
                child: Container(
                  color: Color(0xff2A6DE6),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(height: 1.5),
                              children: [
                                TextSpan(
                                    text: 'Enter',
                                    style: TextStyle(
                                        color: Color(0xff76A7FF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                TextSpan(
                                    text: ' BTC MAINNET',
                                    style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                TextSpan(
                                    text:
                                        ' wallet address. Lorem ipsum dolor sit amet, consectetur.',
                                    style: TextStyle(
                                        color: Color(0xff76A7FF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ]),
                        ),
                      ),
                    ),
                    //next
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerLeft,
                            child:
                                Text('Name as in PANCARD', style: panheadstyle),
                          ),
                          //next
                          SizedBox(height: 10),
                          WithdrawTextField(
                            controller: _pan_name_Controller,
                            focusNode: _pan_name_Node,
                            textInputType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            hintText: '',
                          ),
                          //next
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('PANCARD Number', style: panheadstyle),
                          ),
                          //next
                          SizedBox(height: 10),
                          WithdrawTextField(
                            controller: _pan_number_Controller,
                            focusNode: _pan_number_Node,
                            textInputType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            hintText: '',
                          ),
                          //next
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Identity Type', style: panheadstyle),
                          ),
                          //next
                          SizedBox(height: 10),
                          Container(
                            height: 40,
                            color: Color(0xffF8F8F8),
                            child: DropdownButton(
                                underline: SizedBox(),
                                hint: _dropDownValue == null
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Select Identity Type',
                                          style: TextStyle(
                                            color: Color(0xffB1B1B1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      )
                                    : Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          _dropDownValue,
                                          style: TextStyle(
                                            color: Color(0xffB1B1B1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                isExpanded: true,
                                style: TextStyle(color: Colors.black),
                                items: [
                                  'PANCARD',
                                  'AADHAR CARD',
                                  'DRIVING LICENCE',
                                  'PASSPORT'
                                ]
                                    .map(
                                      (val) => DropdownMenuItem(
                                        child: Text(val),
                                        value: val,
                                      ),
                                    )
                                    .toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _dropDownValue = val;
                                    identiryType = val.toString().toLowerCase();
                                  });
                                }),
                          ),
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Id Picture', style: panheadstyle),
                          ),
                          //next
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () => _pickImage(),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffF8F8F8),
                                  border: Border.all(
                                    color: Color(0XFFB1B1B1),
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                height: 150,
                                child: _croppedFile == null
                                    ? Center(
                                        child: SvgPicture.asset(
                                            'images/imageplus.svg'),
                                      )
                                    : kIsWeb
                                        ? Image.network(_croppedFile.path)
                                        : Image.file(
                                            File(_croppedFile.path),
                                            fit: BoxFit.fill,
                                          )),
                          ),
                          //next
                          SizedBox(height: 26),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: null,
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xffEBEBEB),
                                    borderRadius: BorderRadius.circular(2),
                                    // border:
                                    //     Border.all(color: Color(0XFFB1B1B1)),
                                  ),
                                  child: Text(
                                    'Support',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Color(0XFFB1B1B1)),
                                  ),
                                ),
                              )),
                              SizedBox(width: 10),
                              Expanded(
                                child: InkWell(
                                  onTap: null,
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xff2A6DE6),
                                        borderRadius: BorderRadius.circular(2),
                                        border: Border.all(
                                            color: Color(0XFFB1B1B1))),
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Color(0XFFFFFFFF)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //next
                          SizedBox(height: 16),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'images/hinticon.svg',
                                color: Color(0xffB1B1B1),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Your identity will be verified by the support team',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff808080),
                                    fontSize: 10),
                              )
                            ],
                          ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.width * 0.25,
                          // ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
