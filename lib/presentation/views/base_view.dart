import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_paddy/business_logic/cubits/base_view_cubit/base_view_cubit.dart';
import 'package:movie_paddy/app/exports.dart';
import 'package:movie_paddy/presentation/views/home_view.dart';
import 'package:movie_paddy/presentation/widgets/custom_navigation_bar.dart';

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
