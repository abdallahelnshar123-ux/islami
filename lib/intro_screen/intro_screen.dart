import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "1",
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Click on "),
          Icon(Icons.edit),
          Text(" to edit a post"),
        ],
      ),
      image: const Center(child: Icon(Icons.android)),
    ),
    PageViewModel(
      title: "2",
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Click on "),
          Icon(Icons.edit),
          Text(" to edit a post"),
        ],
      ),
      image: const Center(child: Icon(Icons.android)),
    ),
    PageViewModel(
      title: "3",
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Click on "),
          Icon(Icons.edit),
          Text(" to edit a post"),
        ],
      ),
      image: const Center(child: Icon(Icons.android)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: IntroductionScreen(
        globalBackgroundColor: Colors.blue,
        freeze: true,
        pages: listPagesViewModel,
        back: const Text("Back"),
        showSkipButton: false,
        showBackButton: true,

        next: const Text("Next"),
        done: const Text(
          "Finish",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        onDone: () {
          // On Done button pressed
        },
        onSkip: () {
          // On Skip button pressed
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
