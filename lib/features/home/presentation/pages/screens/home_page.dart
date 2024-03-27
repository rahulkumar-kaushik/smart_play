import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_play/common/colors.dart';
import 'package:just_play/features/home/presentation/bloc/home_bloc.dart';
import 'package:just_play/features/home/presentation/bloc/states/home_state.dart';
import 'package:just_play/features/home/presentation/widgets/gamelistitem.dart';
import 'package:just_play/features/home/presentation/widgets/top_view.dart';

import '../../../../../common/app_constant.dart';
import '../../bloc/events/home_event.dart';

part "../../widgets/home_widgets.dart";

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
    return BlocBuilder<HomeBloc, UserListState>(builder: (context, state) {
      if (state is UserListLoaded) {
        lpaPoints = state.userEntities.length + lpaPoints;
      }
      return Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(
                backgroundColor: AppColors.backgroundColor,
              )),
          backgroundColor: AppColors.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                topMenu(),
                progressView(context, lpaPoints, totalPoints, state),
                const SizedBox(
                  height: 10,
                ),
                const GameListItem(),
              ],
            ),
          ));
    });
  }

  void _updateLpaPoints() {
    BlocProvider.of<HomeBloc>(context).add(FetchLpaData());
  }
}
