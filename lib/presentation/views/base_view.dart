import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BaseView extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomBottomNavigationBar(
        items: [],
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final List<CustomNavBarItem> items;
  final ValueChanged<int>? onChanged;
  final int? currentIndex;
  const CustomBottomNavigationBar(
      {Key? key, required this.items, this.onChanged, this.currentIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items,
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  final Widget activeIcon;
  final bool isActive;
  final Widget? inactiveIcon;
  final VoidCallback onTap;

  const CustomNavBarItem(
      {Key? key,
      required this.activeIcon,
      this.inactiveIcon,
      this.isActive = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isActive ? activeIcon : inactiveIcon ?? activeIcon;
  }
}
