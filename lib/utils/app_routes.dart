import 'package:flutter/cupertino.dart';
import 'package:untitled/screen/dash_screen/view/dash_screen.dart';

import '../screen/contact/view/android_contact_screen.dart';
import '../screen/contact/view/contact_screen.dart';
import '../screen/contact_info/view/android_contact_info_screen.dart';
import '../screen/contact_info/view/contact_info_screen.dart';


// ignore: non_constant_identifier_names
Map<String,WidgetBuilder> screen_routes={
  '/':(context) => const DashScreen(),
  // '/':(context) => const AndroidContactScreen(),
  // 'androidContactInfo':(context) => const AndroidContactInfo(),
};

// ignore: non_constant_identifier_names
Map<String,WidgetBuilder> ios_screen_routes={
  '/':(context) => const ContactScreen(),
  'ContactInfo':(context) => const ContactInfoScreen(),
};
