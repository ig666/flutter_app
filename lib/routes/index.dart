import 'package:flutter_app/pages/camera.dart';
import 'package:flutter_app/pages/nameSpace.dart';
import 'package:flutter_app/pages/person/addPerson.dart';
import 'package:flutter_app/pages/tabsCheck.dart';
import 'package:flutter_app/pages/tabsPage.dart';
import '../main.dart';

final myRoute = {
  '/': (context) => MyApp(),
  '/namespace': (context) => NameSpace(),
  '/tabspage': (context) => TabsPage(),
  '/tabscheck': (context) => TabsCheck(),
  '/camera': (context) => Camera(),
  '/addperson': (context) => AddPerson()
};
