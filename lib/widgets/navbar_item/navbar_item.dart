import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/datamodels/navbar_item_model.dart';
import 'package:the_basics/locator.dart';
import 'package:the_basics/services/navigation_service.dart';
import 'package:the_basics/views/layout_template/layout_template.dart';
import 'package:the_basics/widgets/navbar_item/navbar_item_desktop.dart';
import 'package:the_basics/widgets/navbar_item/navbar_item_mobile.dart';
import 'package:the_basics/extensions/hover_extensions.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final IconData icon;
  const NavBarItem(this.title, this.navigationPath, {this.icon,});

  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(
      title: title,
      navigationPath: navigationPath,
      iconData: icon,
    );
    return ResponsiveBuilder(
      builder:(context,sizingInfo) {return GestureDetector(
        onTap: () {

          locator<NavigationService>().navigateTo(navigationPath);
          if(LayoutTemplate.scaffoldKey.currentState.isDrawerOpen ){
            LayoutTemplate.navigatorState.pop();


            print("reached here2");

          }

          // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
          // SERVICES SHOULD ONLY BE USED FROM A VIEWMODEL

        },
        child: Provider.value(
          value: model,
          child: MouseRegion(
            cursor: MaterialStateMouseCursor.clickable,
            child: ScreenTypeLayout(
              desktop: NavBarItemTabletDesktop(),
              tablet: NavBarItemMobile(),
              mobile: NavBarItemMobile(),
            ).moveUpOnHover,
          )
        ),
      );},
    );
  }
}
