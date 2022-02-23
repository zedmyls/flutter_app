import 'package:flutter/material.dart';
import 'package:flutter_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_app/app/modules/login/controllers/login_tab_controller.dart';
import 'package:get/get.dart';

class LoginViewUI extends GetView<LoginController> {
  const LoginViewUI({Key? key}) : super(key: key);

  LoginTabController get _controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 450,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 25.0,
              )
            ],
            color: Get.isDarkMode ? Color(0xff303030) : Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(16),
                    child: TextButton(
                      onPressed: () {
                        _controller.index = 0;
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    child: TextButton(
                      onPressed: () {
                        _controller.index = 1;
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  '登录，一起玩耍',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 8),
                child: Text(
                  'Let\'s get started',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 8),
                      child: TextFormField(
                        onChanged: (value) {
                          controller.obsParams.update((val) {
                            val!.username = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return '用户名不能为空';
                          }
                          return null;
                        },
                        maxLength: 10,
                        style: TextStyle(fontSize: 18),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: '用户名',
                          counterText: '',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                      child: TextFormField(
                        onChanged: (value) {
                          controller.obsParams.update((val) {
                            val!.password = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return '密码不能为空';
                          }
                          return null;
                        },
                        obscureText: true,
                        style: TextStyle(fontSize: 18),
                        keyboardType: TextInputType.text,
                        maxLength: 16,
                        decoration: InputDecoration(
                          hintText: '密码',
                          counterText: '',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.all(16),
                        decoration:
                            BoxDecoration(color: Theme.of(context).colorScheme.secondary, shape: BoxShape.circle),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            controller.login();
                          },
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
