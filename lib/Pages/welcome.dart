import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/logo.jpeg', // 请确保 assets 目录下有 logo.png
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              Text(
                '欢迎使用皎月连',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 50), // 让按钮撑满宽度
                      // backgroundColor: Colors.blue, // 按钮背景色
                      // foregroundColor: Colors.white, // 文字颜色
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    child: Text('登录'),
                  ),
                  SizedBox(height: 10), // 间距
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                      print("点击注册");
                    },
                    child: Text(
                      '没有账号？点击注册',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue, // 文字颜色
                      ),
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
