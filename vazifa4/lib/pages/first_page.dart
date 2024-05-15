import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/seacond");
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: Image.asset("assets/logo.png"),
            ),
            const Text(
              "Loopday App",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ));
  }
}

class SeaconPage extends StatefulWidget {
  const SeaconPage({super.key});

  @override
  State<SeaconPage> createState() => _SeaconPageState();
}

class _SeaconPageState extends State<SeaconPage> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                OnBoardingWidget(
                  text1: "assets/image1.png",
                  text2:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  index: 0,
                  onTap: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                OnBoardingWidget(
                  text1: "assets/image2.png",
                  text2:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  index: 1,
                  onTap: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                OnBoardingWidget(
                  text1: "assets/image3.png",
                  text2:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  index: 2,
                  onTap: () {
                    Navigator.pushNamed(context, "/third");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class OnBoardingWidget extends StatelessWidget {
  String text1;
  String text2;
  final int index;
  final Function() onTap;

  OnBoardingWidget({super.key, 
    required this.text1,
    required this.text2,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: Image.asset(
                    text1,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Set Your Scheduela",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  text2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: index == 0 ? 10 : 5,
                      backgroundColor: index == 0 ? Colors.blue : null,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: index == 1 ? 10 : 5,
                      backgroundColor: index == 1 ? Colors.blue : null,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: index == 2 ? 10 : 5,
                      backgroundColor: index == 2 ? Colors.blue : null,
                    )
                  ],
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 100, right: 100),
                      child: Text("Get Started"),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
