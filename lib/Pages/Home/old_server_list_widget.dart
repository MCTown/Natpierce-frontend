import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OldServerList extends StatelessWidget {
  const OldServerList({super.key, required this.servers});

  final List<String> servers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 左侧：服务器列表区域，使用 Expanded 占据剩余宽度
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 使用 Expanded 为 ListView 提供高度约束
              Expanded(
                child: ListView.builder(
                  itemCount: servers.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            Icon(Icons.computer, color: Colors.lightBlue),
                            SizedBox(width: 10),
                            Text(servers[index]),
                          ],
                        ),
                        onTap: () {
                          print('点击了服务器：${servers[index]}');
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        /// 分割线
        SizedBox(
          width: 1,
          height: double.infinity,
          child: Container(color: Colors.grey),
        ),
        SizedBox(
          width: 1,
          height: double.infinity,
          child: Container(color: Colors.white),
        ),
        SizedBox(
          width: 1,
          height: double.infinity,
          child: Container(color: Colors.grey),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: ListView(
                    children: [
                      serverProperty(
                        ' 主机名',
                        'Linux',
                        Icon(FontAwesomeIcons.computer, size: 15),
                      ),
                      serverProperty(
                        'IP',
                        '1.2.3.4',
                        Icon(FontAwesomeIcons.locationPin, size: 15),
                      ),
                      serverProperty(
                        '主机状态',
                        // todo
                        true ? '组网服务已启动' : '组网服务未启动',
                        Icon(Icons.check_circle, size: 15),
                      ),
                      serverProperty(
                        '连接状态',
                        '未连接',
                        Icon(Icons.cast_connected, size: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget serverProperty(String title, String value, Icon icon) {
  return Card(
    elevation: 2, // 去除阴影
    child: ListTile(
      // 更小的内边距
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14, // 更小的字体
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        value,
        style: TextStyle(
          fontSize: 12, // 更小的副标题字体
          color: Colors.grey[700],
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 12, // 更小的图标
        color: Colors.grey,
      ),
    ),
  );
}
