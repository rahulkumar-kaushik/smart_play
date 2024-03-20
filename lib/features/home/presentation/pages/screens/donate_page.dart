import 'package:flutter/material.dart';

import '../../widgets/web_view.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Scaffold(body: WebView(url:"https://bestplay.app/donation/"))
    );
  }
}