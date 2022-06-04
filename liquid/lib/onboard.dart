import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final controller = PageController();
  bool isLastpage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index){
            setState(()=> isLastpage = index ==2
            );
          },
          children: [
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
      ),
      bottomSheet:isLastpage ? 
      TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
        primary: Colors.black,
        backgroundColor: Colors.teal,
        minimumSize: const Size.fromHeight(80),  
        ),
        onPressed :(){
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder:(context) => 
         
        },
        child: const Text("Get Started",style :TextStyle(fontSize: 20)
        )) :
       Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  controller.jumpToPage(page: 2);
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
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
                      page: page > 2 ? 0 : page, duration: 300);
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
          ],
        ),
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