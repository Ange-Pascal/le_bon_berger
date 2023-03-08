import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = const Color.fromRGBO(24, 97, 44, 1);
  final Text title;

  /// you can add more fields that meet your needs

  const BaseAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(children: [
        Container(
          height: 40,
          width: 40,
          child: Image.asset("assets/images/lebonberger.jpeg"),
        ),
        SizedBox(width: 10),
        Container(
          child: Text('Le Bon Berger'),
        )
      ]),
      backgroundColor: backgroundColor,
      actions: <Widget>[
        Container(
            height: 55,
            width: 55,
            padding: EdgeInsets.only(right: 15.0),
            child: Image.asset("assets/images/user.png")),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(60.0);
}
