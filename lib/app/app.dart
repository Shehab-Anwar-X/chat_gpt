import 'package:flutter/material.dart';

import '../module/chat/presentation/view/chat.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(platform: TargetPlatform.iOS),
      home: const ChatView(),
      routes: <String, WidgetBuilder>{
        ChatView.routeName: (context) => const ChatView(),
      },
    );
  }
}
