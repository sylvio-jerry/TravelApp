import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travel/app/modules/home/views/home_view.dart';
import 'package:travel/app/shared/themes/app_color.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Travel',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.white, fontFamily: 'Lobster'),
                ),
                const SizedBox(width: 10),
                ClipRRect(
                    child: Image.asset("assets/icons/globe_icon.png",
                        width: 30, height: 30, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Find Your Dream",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white, fontFamily: 'Roboto'),
            ),
            const SizedBox(height: 5),
            Text(
              "Destination With Us",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white, fontFamily: 'Roboto'),
            ),
          ],
        ),
      ),
      nextScreen: HomeView(),
      duration: 1000,
      backgroundColor: AppColor.primaryLight,
      splashTransition: SplashTransition.scaleTransition,
      splashIconSize: 200,
      centered: true,
    );
  }
}
