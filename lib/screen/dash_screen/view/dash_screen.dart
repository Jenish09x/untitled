import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screen/contact/view/android_contact_screen.dart';
import 'package:untitled/screen/contact_info/view/android_contact_info_screen.dart';
import 'package:untitled/screen/dash_screen/provider/dash_screen_provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashProvider? providerR;
  DashProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR=context.read<DashProvider>();
    providerW=context.watch<DashProvider>();
    List<Widget>screen=[
      const AndroidContactScreen(),
      const AndroidContactInfo(),
    ];
    return SafeArea(
      child: Scaffold(
        body: screen[providerW!.stepIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: providerR!.stepIndex,
          onTap: (value) {
            int i = value;
            providerR!.changeStep(i);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Contact'),
          ],
        ),
      ),
    );
  }
}
