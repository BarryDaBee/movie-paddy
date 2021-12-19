import 'package:flutter/material.dart';
import 'package:movie_paddy/app/exports.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 26.w,
        vertical: 48.h,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.red])
                        .createShader(bounds);
                  },
                  child: const Text('Stream')),
              SizedBox(width: 20.w),
              const Text('Everywhere'),
            ],
          ),
        ],
      ),
    );
  }
}
