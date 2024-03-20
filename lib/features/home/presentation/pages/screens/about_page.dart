import 'package:flutter/material.dart';
import 'package:just_play/features/home/presentation/widgets/web_view.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: WebView(url: "https://bestplay.app/"));
  }
}
