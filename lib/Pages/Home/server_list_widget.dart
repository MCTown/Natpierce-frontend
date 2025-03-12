import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServerList extends StatefulWidget {
  const ServerList({super.key, required this.servers});

  final Map<String, Server> servers;

  @override
  _ServerList createState() => _ServerList();
}

class _ServerList extends State<ServerList> {
  late Map<String, Server> servers;
  int selectedGroup = -1;
  bool isFloatingButtonOpen = false;

  @override
  void initState() {
    super.initState();
    // 在 initState 中设置 groupValue 为传递的 initialValue
    servers = widget.servers;
  }

  /// Map<"服务器名字",Map<"属性名",属性值>>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: servers.length,
          itemBuilder: (context, index) {
            List<String> serverNames = servers.keys.toList();
            return serverCard(context, servers[serverNames[index]]!, index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 发送一个snackBar通知
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                "启动${servers.values.elementAt(selectedGroup).name}",
              ),
            ),
          );
        },
        child: Icon(Icons.start),
      ),
    );
  }

  Widget serverCard(BuildContext context, Server server, int index) {
    return ListTile(
      onTap:
          () => {
            setState(() {
              selectedGroup = index;
              isFloatingButtonOpen = true;
            }),
          },
      title: Text(
        server.name,
        style: TextStyle(
          color:
              selectedGroup == index
                  ? Theme.of(context).primaryColor
                  : Colors.black,
        ),
      ),
      subtitle: AnimatedContainer(
        curve: Curves.easeOut,
        // curve: Cubic(0.06,0.82,0.25,0.92),
        duration: Duration(milliseconds: 200),
        height: selectedGroup == index ? 150 : 20,
        child:
            selectedGroup == index
                ? SingleChildScrollView(
                  /// 防止溢出报错
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("IP:${server.ip}:${server.port}"),
                      ),
                      Text("todo 此处展示详细状态"),
                    ],
                  ),
                )
                : Text("IP:${server.ip}:${server.port}"),
      ),
      // trailing: Icon(Icons.arrow_drop_down)
      isThreeLine: true,
      leading: Icon(
        Icons.computer,
        color:
            selectedGroup == index
                ? Theme.of(context).primaryColor
                : Colors.black,
      ),
      trailing: Radio(
        value: index,
        groupValue: selectedGroup,
        onChanged: (value) {
          setState(() {
            selectedGroup = value!;
            isFloatingButtonOpen = true;
          });
          // Update value.
        },
      ),
    );
  }
}

Widget serverCard1(BuildContext context, Server server) {
  return Theme(
    data: ThemeData(dividerColor: Theme.of(context).primaryColor),
    child: ExpansionTile(
      title: Row(
        children: [
          Icon(FontAwesomeIcons.server),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                server.name,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                "${server.ip}:${server.port}",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      children: <Widget>[
        ListTile(
          title: Column(
            children: [
              Chip(
                backgroundColor:
                    server.isConnected
                        ? Color.fromARGB(30, 0, 255, 0)
                        : Color.fromARGB(10, 255, 0, 0),
                avatar: Icon(
                  server.isConnected ? Icons.check : Icons.close,
                  color: Theme.of(context).primaryColor,
                ),
                label: Text(server.isAvailableServer ? "组网服务已启动" : "组网服务未启动"),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class Server {
  final String name;
  final String ip;
  final int port;
  final bool isAvailableServer;

  /// 服务是否启动
  final bool isConnected;
  final bool isPortForward;

  /// 服务类型

  Server({
    required this.isPortForward,
    required this.name,
    required this.ip,
    required this.port,
    required this.isAvailableServer,
    required this.isConnected,
  });
}

enum Protocol { tcp, udp }

class PortMap {
  final String portingName;
  final String lanIp;
  final int localPort;
  final int remotePort;
  final Protocol protocol;

  PortMap({
    required this.portingName,
    required this.lanIp,
    required this.localPort,
    required this.remotePort,
    required this.protocol,
  });
}
