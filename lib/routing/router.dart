import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_basics/routing/route_names.dart';
import 'package:the_basics/views/about/about_view.dart';
import 'package:the_basics/views/contact_me/contact_me.dart';
import 'package:the_basics/views/home/home_view.dart';
import 'package:the_basics/views/my_work/my_work.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeView(), settings);
    case AboutRoute:
      return _getPageRoute(AboutView(), settings);
    case MyWorkRoute:
      return _getPageRoute(MyWork(), settings);
    case ContactMeRoute:
      return _getPageRoute(ContactMe(), settings);
    default:
      return _getPageRoute(HomeView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
