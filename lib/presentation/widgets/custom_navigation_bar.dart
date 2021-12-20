import 'package:flutter/material.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(items.length, (index) {
        var item = items[index];
        return InkWell(
            onTap: () {
              onChanged?.call(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: item..active = currentIndex == index,
            ));
      }),
    );
  }
}

class CustomNavBarItem extends StatelessWidget {
  final Widget activeIcon;
  bool isActive;
  final Widget? inactiveIcon;

  set active(bool value) => isActive = value;

  CustomNavBarItem({
    Key? key,
    required this.activeIcon,
    this.inactiveIcon,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isActive ? activeIcon : inactiveIcon ?? activeIcon;
  }
}
