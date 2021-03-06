import 'package:flutter/material.dart';


class RoundedAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final Widget bottom;
  final bool backable;
  final List<Widget> actions;
  final Widget leading;


  RoundedAppBar({Key key, this.title, this.bottom, this.backable, this.actions, this.leading}) : preferredSize = Size.fromHeight(50.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).toggleableActiveColor,
        ),
      ),
      iconTheme: IconThemeData(
        color: Theme.of(context).toggleableActiveColor,
      ),
      automaticallyImplyLeading: backable == null ? true : backable,
      centerTitle: true,
      bottom: bottom,
      actions: actions,
      leading: leading,
      backgroundColor: Theme.of(context).dividerColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }


}