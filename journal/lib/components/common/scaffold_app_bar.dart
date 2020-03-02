import 'package:flutter/material.dart';

class ScaffoldAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  const ScaffoldAppBar({Key key, this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(title),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.brightness_medium, color: Colors.white),
          tooltip: 'Settings',
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}