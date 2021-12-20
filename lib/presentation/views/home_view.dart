import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_paddy/app/exports.dart';
import 'package:movie_paddy/presentation/widgets/featured_movie_card.dart';
import 'package:movie_paddy/presentation/widgets/trending_movie_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 26.w,
        vertical: 48.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFFF8F71),
                      Color(0xFFEF2D1A),
                    ],
                  ).createShader(bounds);
                },
                child: Text(
                  'Stream',
                  style: textTheme.headline2,
                ),
              ),
              Space.x(10.sp),
              Text(
                'Everywhere',
                style: textTheme.headline2,
              ),
            ],
          ),
          Space.y(30.sp),
          const FeaturedMovieCard(),
          Space.y(43.h),
          Text(
            "Trending",
            style: textTheme.headline2,
          ),
          Space.y(28.h),
          CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, pageViewIndex) {
              return const TrendingMovieCard();
            },
            options: CarouselOptions(
              height: 340.h,
              enableInfiniteScroll: true,
              viewportFraction: 0.75,
              autoPlay: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
