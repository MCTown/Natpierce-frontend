import 'package:flutter/material.dart';
import 'Home/server_list_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            /// 侧边栏头部
          ],
        ),
      ),
      appBar: AppBar(title: Text('主机列表'), elevation: 1.0),
      body: ServerList(
        servers: {
          "server1": Server(
            ip: "127.0.0.1",
            name: "server1",
            port: 22,
            isAvailableServer: false,
            isConnected: false,
            isPortForward: false
          ),
          "server2": Server(
            ip: "10.66.99.99",
            name: "server2",
            port: 22,
            isAvailableServer: false,
            isConnected: false,
            isPortForward: false
          ),
          "server3": Server(
            ip: "10.66.99.98",
            name: "server3",
            port: 22,
            isAvailableServer: true,
            isConnected: true,
            isPortForward: false
          ),
        },
      ),
    );
  }
}
