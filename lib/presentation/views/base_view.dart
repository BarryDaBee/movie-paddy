import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_paddy/business_logic/cubits/base_view_cubit/base_view_cubit.dart';
import 'package:movie_paddy/app/exports.dart';
import 'package:movie_paddy/presentation/views/home_view.dart';

class BaseView extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  Widget _getCurrentPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const HomeView();
      default:
        return const Text("Nothing to see here");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BaseViewCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: const Color(0xFF15141F),
          body: BlocBuilder<BaseViewCubit, BaseViewState>(
            builder: (context, state) {
              return _getCurrentPage(state.currentIndex);
            },
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: context.watch<BaseViewCubit>().state.currentIndex,
            onChanged: (index) {
              BlocProvider.of<BaseViewCubit>(context).setIndex(index);
            },
            items: [
              CustomNavBarItem(
                activeIcon: SvgPicture.asset('home_active'.svg),
                inactiveIcon: SvgPicture.asset('home_inactive'.svg),
              ),
              CustomNavBarItem(
                activeIcon: SvgPicture.asset('play_active'.svg),
                inactiveIcon: SvgPicture.asset('play_inactive'.svg),
              ),
              CustomNavBarItem(
                activeIcon: const Icon(Icons.home, color: Colors.blue),
                inactiveIcon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final List<CustomNavBarItem> items;
  final ValueChanged<int>? onChanged;
  final int? currentIndex;

  const CustomBottomNavigationBar(
      {Key? key, required this.items, this.onChanged, this.currentIndex = 0})
      : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.items.length, (index) {
        var item = widget.items[index];
        return InkWell(
            onTap: () {
              widget.onChanged?.call(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: item..active = widget.currentIndex == index,
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
