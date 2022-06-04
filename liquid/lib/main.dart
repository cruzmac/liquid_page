import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:liquid/onboard.dart';
import 'package:liquid/splash.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:page_transition/page_transition.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Onboard());
  }
}
class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset("assets/93967-dice-roll-8zen.json"),
      backgroundColor:Colors.white,
      nextScreen: mainpage(),
      splashIconSize: 700,
      duration: 2800,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: Duration(seconds: 1),
    );
  }
}


// ignore: camel_case_types
class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

// ignore: camel_case_types
class _mainpageState extends State<mainpage> {
  final controller = LiquidController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            liquidController: controller,
            // enableSideReveal: true,
            onPageChangeCallback: (index) {
              setState(() {});
            },
            slideIconWidget: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            pages: [
            //   Container(
            //     color: Colors.blueGrey,
            //     child: const Center(child:Text("GD",
            //     style: TextStyle(fontSize: 30),),
            //   ),
            // ),
            //   Container(
            //     color: Colors.green,
            //     child:const Center(child:Text("GD",
            //     style: TextStyle(fontSize: 10),),
            //   ),
            // ),
              buildPage(
                  url: "assets/tata.png",
                  title: "Indian Premier League",
                  subtitle: "Cricket",
                  color: Colors.blue.shade200),
              buildPage(
                url: "assets/csk2.png",
                title: "CHENNAI SUPER KINGS",
                subtitle: "whistle podu",
                color: Colors.yellow.shade600,
              ),
              buildPage(
                url: "assets/mi2.png",
                title: "MUMBAI INDIANS",
                subtitle: "Nakku setha payale",
                color: Colors.blue.shade900,
              ),
              buildPage(
                  url: "assets/rcb.png",
                  title: "ROYAL CHALLENGERS BANGALORE",
                  subtitle: "Lost the League but won the hearts, kidney, liver",
                  color: Colors.red.shade700),
              buildPage(
                  url: "assets/kkr.png",
                  title: "KOLKATA KNIGHT RIDERS",
                  subtitle: "Cricket",
                  color: Colors.purple.shade800),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 32,
            left: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      controller.jumpToPage(page: 4);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )
                  ),
                AnimatedSmoothIndicator(
                  activeIndex: controller.currentPage,
                  count: 5,
                  effect: const WormEffect(
                    dotColor: Colors.white60,
                    activeDotColor: Colors.white,
                    spacing: 5,
                  ),
                  onDotClicked: (index) {
                    controller.animateToPage(page: index);
                  },
                ),
                TextButton(
                    onPressed: () {
                      final page = controller.currentPage + 1;
                      controller.animateToPage(
                          page: page > 4 ? 0 : page, duration: 300);
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget buildPage({
  required String url,
  required String title,
  required String subtitle,
  required Color color,
}) =>
    Container(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            url,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          const SizedBox(
            height: 44,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.bold),
          ),
           const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.only(right: 32),
            child: Text(
              subtitle,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
