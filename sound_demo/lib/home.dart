import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/services.dart';

import 'notification.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    NotificationPlugin.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            EleButton(1, 'cat'),
            EleButton(2, 'bird'),
            EleButton(3, 'bird2'),
            EleButton(4, 'eagle'),
            EleButton(5, 'lion'),
          ],
        ),
      ),
    );
  }
}

class EleButton extends StatelessWidget {
  const EleButton(this.id, this.val, {super.key});

  final String val;
  final int id;

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return ElevatedButton(
      onPressed: () async {
        // print(RawResourceAndroidNotificationSound(val).sound);
        await NotificationPlugin.showNotification(
          i,
          'Bildirim Başlığı',
          'Bildirim İçeriği',
          sound: val,
        );
        i++;
      },
      child: Text(val),
    );
  }
}
