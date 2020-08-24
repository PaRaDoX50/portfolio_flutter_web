import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/routing/route_names.dart';
import 'package:the_basics/widgets/navbar_item/navbar_item.dart';
import 'package:the_basics/widgets/navigation_drawer/navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: ListView(
        children: <Widget>[
          NavigationDrawerHeader(),
          // BONUS: Combine the UI for this widget with the NavBarItem and make it responsive.
          // The UI for the current DrawerItem shows when it's in mobile, else it shows the NavBarItem ui.
          NavBarItem(
            'Home',
            HomeRoute,
            icon: Icons.home,
          ),
          NavBarItem(
            'My Work',
            MyWorkRoute,
            icon: Icons.music_note,
          ),
          NavBarItem(
            'About',
            AboutRoute,
            icon: Icons.help,

          ),
          NavBarItem(
            'Contact me',
            ContactMeRoute,
            icon: Icons.contact_mail,

          ),
        ],
      ),
    );
  }
}
