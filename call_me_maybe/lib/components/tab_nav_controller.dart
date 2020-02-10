import 'package:flutter/material.dart';
import 'app_scaffold.dart';

class TabNavController extends StatelessWidget {

  final String title;
  
  static const tabs = [
    Tab(icon: Icon(Icons.account_circle)),
    Tab(icon: Icon(Icons.business_center)),
    Tab(icon: Icon(Icons.gesture)),
  ];
  
  TabNavController({Key key, this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: AppScaffold(title: title, tabs: tabs),
    );
  }
}