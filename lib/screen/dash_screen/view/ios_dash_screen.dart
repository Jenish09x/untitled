import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screen/contact/view/contact_screen.dart';
import 'package:untitled/screen/contact_info/view/contact_info_screen.dart';

import '../provider/dash_screen_provider.dart';

class IosDashScreen extends StatefulWidget {
  const IosDashScreen({super.key});

  @override
  State<IosDashScreen> createState() => _IosDashScreenState();
}

class _IosDashScreenState extends State<IosDashScreen> {
  DashProvider? providerR;
  DashProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<DashProvider>();
    providerW = context.watch<DashProvider>();
    List<Widget>screen = [
      const ContactScreen(),
      const ContactInfoScreen(),
    ];
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: providerR!.stepIndex,
        onTap: (value) {
          int i = value;
          providerR!.changeStep(i);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ), tabBuilder: (BuildContext context, int index) {
      return CupertinoTabView(
        builder: (BuildContext context){
          return screen[providerW!.stepIndex];
        },
      );
    },
    );
  }
}
