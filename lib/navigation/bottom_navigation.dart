import 'package:clevertap_plugin/clevertap_plugin.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/app_constant.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: widget.child,
        ),
        bottomNavigationBar: ConvexAppBar(
          elevation: 5,
          style: TabStyle.react,
          activeColor: Colors.white,
          initialActiveIndex: 2,
          items: const [
            TabItem(icon: Icon(Icons.info), title: 'About', isIconBlend: true),
            TabItem(icon: Icon(newspaper), title: 'News', isIconBlend: true),
            TabItem(
                icon: Icon(Icons.local_play_rounded),
                title: 'Play',
                isIconBlend: true),
            TabItem(
                icon: Icon(Icons.support), title: 'Donate', isIconBlend: true),
            TabItem(icon: Icon(redeem), title: 'Rewards', isIconBlend: true),
          ],
          onTap: (index) {
            CleverTapPlugin.recordEvent(
                "bottom_tab_event", {"name": widget.child.currentIndex});
            widget.child.goBranch(
              index,
              initialLocation: index == widget.child.currentIndex,
            );
            setState(() {});
          },
        )

/*
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.child.currentIndex,
        onTap: (index) {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_play_rounded),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: Icon(redeem),
            label: 'Rewards',
          ),
        ],
      ),*/
        );
  }
}
