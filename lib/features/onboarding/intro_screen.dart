import 'package:flutter/material.dart';
/*Onboarding package*/
import 'package:introduction_screen/introduction_screen.dart';
import 'package:just_play/utils/shared_pref_utils.dart';

import '../../main.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<StatefulWidget> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    SharedPrefsUtils().setBool("onboarded", true);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const NavScreen()));
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/images/reward_bg.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('coins.png', 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: const Text(
              'Let\'s go right away!',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => _onIntroEnd(context),
          ),
        ),
      ),
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showNextButton: true,
      showBackButton: true,
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Page 1",
          body:
              "This is a description on a page with an orange title and bold, big body.",
          image: const Center(
            child: Text("👋", style: TextStyle(fontSize: 100.0)),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(color: Colors.orange),
            bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
        ),
        PageViewModel(
          title: "Page 2",
          body:
              "This is a description on a page with an orange title and bold, big body.",
          image: const Center(
            child: Text("👋", style: TextStyle(fontSize: 100.0)),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(color: Colors.brown),
            bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
        ),
        PageViewModel(
          title: "Full Screen Page",
          body:
              "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
            safeArea: 100,
          ),
        ),
        PageViewModel(
          title: "Page 1",
          body:
              "This is a description on a page with an orange title and bold, big body.",
          image: const Center(
            child: Text("👋", style: TextStyle(fontSize: 100.0)),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(color: Colors.orange),
            bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
        ),
        PageViewModel(
          title: "Page 2",
          body:
              "This is a description on a page with an orange title and bold, big body.",
          image: const Center(
            child: Text("👋", style: TextStyle(fontSize: 100.0)),
          ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(color: Colors.brown),
            bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
          ),
        )
      ],
    );
  }
}
