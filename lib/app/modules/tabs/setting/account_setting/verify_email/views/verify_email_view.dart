import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/common/views/my_buttons.dart';
import 'package:get/get.dart';

class VerifyEmailView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VerifyEmailViewState();
  }
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  String string = '';
  String code1 = '';
  String code2 = '';
  String code3 = '';
  String code4 = '';
  String code5 = '';
  String code6 = '';
  bool verify = false;
  bool isSend = false;
  bool disabled = false;
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        title: '验证邮箱',
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 25.0,
                  )
                ],
                color: Get.isDarkMode ? Color(0xff505050) : Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32))),
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 16, top: 32),
                  child: Text(
                    '请输入验证码',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Obx(
                      () => RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: isSend ? '验证码已发送到' : '即将发送验证码到',
                              style: TextStyle(
                                fontSize: 18,
                                color: Get.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: _showEmail(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _inputFields(code1),
                      _inputFields(code2),
                      _inputFields(code3),
                      _inputFields(code4),
                      _inputFields(code5),
                      _inputFields(code6),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: 160,
                      padding: EdgeInsets.only(left: 16, right: 16, top: 0),
                      child: LineButton(
                        title: isSend ? (disabled ? '重新发送 (${60 - timer!.tick})' : '重新发送') : '发送',
                        type: isSend ? ButtonType.danger : ButtonType.info,
                        onPressed: (!isSend || !disabled)
                            ? () async {
                                await HttpUtils.instance.put('account');

                                setState(() {
                                  isSend = true;
                                  disabled = true;
                                  timer = Timer.periodic(Duration(seconds: 1), (_) {
                                    if (timer!.tick >= 60) {
                                      disabled = false;
                                      timer!.cancel();
                                    }
                                    setState(() {});
                                  });
                                });
                              }
                            : null,
                      ),
                    ),
                    Text(
                      'tips：有效期1分钟',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: verify ? Colors.blueAccent : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              loadingToast(
                                () => HttpUtils.instance.patch(
                                  'account',
                                  data: {'code': string},
                                ),
                                successCallback: (res) async {
                                  await Get.find<UserController>().load();
                                  Get.back();
                                  showSuccessMessage('邮箱验证成功');
                                },
                              );
                            },
                            icon: Icon(Icons.check),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(32),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _createCalcButton('1'),
                    _createCalcButton('2'),
                    _createCalcButton('3'),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _createCalcButton('4'),
                    _createCalcButton('5'),
                    _createCalcButton('6'),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _createCalcButton('7'),
                    _createCalcButton('8'),
                    _createCalcButton('9'),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _createCalcButton(''),
                    _createCalcButton('0'),
                    InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          deleteCode();
                        },
                        child: Container(
                            alignment: Alignment.center,
                            // decoration: BoxDecoration(shape: BoxShape.circle),
                            width: 70,
                            height: 70,
                            child: Icon(Icons.backspace)))
                  ],
                ),
                SizedBox(
                  height: 14,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _showEmail() {
    String email = Get.find<UserController>().user.email!;
    int index = email.indexOf('@');
    if (index > 3) {
      return email.replaceRange(3, index, List.filled(index - 3, '*').join(''));
    }
    return email.replaceRange(1, index, List.filled(index - 1, '*').join(''));
  }

  Widget _inputFields(String s) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 55,
      child: Text(
        s,
        style: TextStyle(fontSize: 28),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle, border: Border.all(color: Colors.black26), borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _createCalcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: value.isNotEmpty
            ? () {
                updateCode(value);
              }
            : null,
        child: Container(
          alignment: Alignment.center,
          width: 70,
          height: 70,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  void updateCode(String value) {
    switch (string.length) {
      case 0:
        {
          setState(() {
            code1 = value;
          });
          break;
        }
      case 1:
        {
          setState(() {
            code2 = value;
          });
          break;
        }
      case 2:
        {
          setState(() {
            code3 = value;
          });
          break;
        }
      case 3:
        {
          setState(() {
            code4 = value;
          });
          break;
        }
      case 4:
        {
          setState(() {
            code5 = value;
          });
          break;
        }
      case 5:
        {
          setState(() {
            code6 = value;
          });
          break;
        }
      default:
        {
          return;
        }
    }
    string += value;
    if (string.length > 5) {
      setState(() {
        verify = true;
      });
      return;
    } else {
      return;
    }
  }

  void deleteCode() {
    switch (string.length) {
      case 1:
        {
          setState(() {
            code1 = '';
          });
          break;
        }
      case 2:
        {
          setState(() {
            code2 = '';
          });
          break;
        }
      case 3:
        {
          setState(() {
            code3 = '';
          });
          break;
        }
      case 4:
        {
          setState(() {
            code4 = '';
          });
          break;
        }
      case 5:
        {
          setState(() {
            code5 = '';
          });
          break;
        }
      case 6:
        {
          setState(() {
            code6 = '';
          });
          break;
        }
      default:
        {
          return;
        }
    }
    string = string.substring(0, string.length - 1);
    if (string.length < 4) {
      setState(() {
        verify = false;
      });
    }
  }
}
