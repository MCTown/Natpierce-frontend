import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(title: Text('登录')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: '注册邮箱',
                      // border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: '验证码',
                      // border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.verified),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: '请输入密码',
                      // border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_open),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: '请重复密码',
                      // border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      /// todo
                      final bool registerSuccess = true;

                      /// 判断注册
                      if (registerSuccess) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (route) => false, // 清空所有历史路由
                        );
                      } else {
                        setState(() {
                          /// 刷新页面，提示登录失败
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 50), // 让按钮撑满宽度
                      // backgroundColor: Colors.blue, // 按钮背景色
                      // foregroundColor: Colors.white, // 文字颜色
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // 让内容居中
                      children: [
                        Icon(Icons.app_registration, size: 20),
                        // ✔ 图标
                        SizedBox(width: 8),
                        // 间距
                        Text("注册"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
