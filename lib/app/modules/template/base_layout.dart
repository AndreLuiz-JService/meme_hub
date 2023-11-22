import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/ui/assets/assets_app.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../models/navigation/nav_item_info.dart';
import 'package:collection/collection.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key, required this.body});
  final Widget body;

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  int? indexSelected;

  @override
  void initState() {
    indexSelected = 0;
    Modular.to.navigate('/main/home/');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<NavItemInfo> navItes = [
      NavItemInfo(
        iconPath: context.assets.bottomNavigatorIconHome,
        moduleRoute: '/main/home',
      ),
      NavItemInfo(
        iconPath: context.assets.bottomNavigatorIconAdd,
        moduleRoute: '/adding_post',
      ),
      NavItemInfo(
        iconPath: context.assets.bottomNavigatorIconAccount,
        moduleRoute: '/main/profile',
      ),
    ];

    void setRouter(int index) {
      setState(() {
        indexSelected = index;
      });
      final route = navItes[index].moduleRoute;
      Modular.to.navigate(route);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.body,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colorWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, -2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: navItes
              .mapIndexed<Widget>(
                (index, navItemInfo) => NavBarWidget(
                  navItemInfo: navItemInfo,
                  isSelected: index == indexSelected,
                  onTap: () => setRouter(index),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    super.key,
    required this.navItemInfo,
    required this.isSelected,
    required this.onTap,
  });

  final NavItemInfo navItemInfo;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color iconColor = isSelected ? primary : iconGrey;

    return Expanded(
      child: Container(
        height: 60,
        padding: const EdgeInsets.only(bottom: 8),
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: onTap,
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  navItemInfo.iconPath,
                  colorFilter: ColorFilter.mode(
                    iconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
