import 'package:flutter/material.dart';
import 'package:just_play/core/constants/constants.dart';
import 'package:just_play/features/home/presentation/widgets/top_view.dart';

class JustPlayApp extends StatelessWidget {
  const JustPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int lpaPoints = 0;
  int totalPoints = 1000;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _updateLpaPoints();
        break;

      case AppLifecycleState.detached:
      // TODO: Handle this case.
      case AppLifecycleState.inactive:
      // TODO: Handle this case.
      case AppLifecycleState.hidden:
      // TODO: Handle this case.
      case AppLifecycleState.paused:
      // TODO: Handle this case.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.deepPurpleAccent])),
            child: Column(children: [
              Center(
                  child: Image.asset(
                'assets/images/justplay.png',
                height: 80,
                width: 130,
              )),
              progressView(context, lpaPoints, totalPoints),
            ])),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "${AppStrings.keepPlaying}!",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.indigo),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(144),
                child: Image.asset(
                  AppStrings.gameThumbnailPath,
                  height: 250,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  void _updateLpaPoints() {
    setState(() {
      lpaPoints += 100;
    });
  }
}
