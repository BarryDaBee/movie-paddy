import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_paddy/presentation/views/base_view.dart';
import 'package:movie_paddy/presentation/shared/theme.dart';

void main() {
  runApp(const MoviePaddy());
}

class MoviePaddy extends StatelessWidget {
  const MoviePaddy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(405, 878),
      builder: () {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ).copyWith(
            textTheme: appTheme,
          ),
          themeMode: ThemeMode.dark,
          home: const BaseView(),
        );
      },
    );
  }
}
