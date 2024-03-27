import 'dart:async';

import 'package:clevertap_plugin/clevertap_plugin.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:geolocator/geolocator.dart';
import 'package:just_play/features/cashout/presentation/bloc/events/userlist_event.dart';
import 'package:just_play/features/cashout/presentation/bloc/userlist_bloc.dart';
import 'package:just_play/features/onboarding/intro_screen.dart';
import 'package:just_play/navigation/custom_helper.dart';
import 'package:just_play/utils/shared_pref_utils.dart';

import 'common/app_bloc.dart';
import 'common/app_constant.dart';
import 'core/di/injector.dart';
import 'features/home/presentation/bloc/events/home_event.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

/* Separate files of main */
part '../../features/onboarding/splash_screen.dart';

Future<void> main() async {
  CustomNavigationHelper.instance;
  init();
  Bloc.observer = AppBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => sl<UserListBloc>()..add(FetchUsers()),
    ),
    BlocProvider(
      create: (_) => sl<HomeBloc>()..add(FetchLpaData()),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
    initCleverTap();
    SharedPrefsUtils.init();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    String udid = await FlutterUdid.udid;

    if (kDebugMode) {
      print("Device Id: $udid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }

  /*
  * CleverTap Initialization*/
  initCleverTap() async {
    await CleverTapPlugin.init("", "", "");
  }
}

checkConnectivity(BuildContext context) async {
  final connectivityResult = await Connectivity().checkConnectivity();
  print("Connected: $connectivityResult");
  if (connectivityResult[0] == ConnectivityResult.none) {
    isConnected = false;
    _showNetworkErrorDialog(context);
  } else {
    isConnected = true;
    _goNext(context);
  }
}

_showNetworkErrorDialog(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Error",
                    maxLines: 1,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Icon(
                    Icons.signal_wifi_connected_no_internet_4,
                    size: 150,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "No Internet Connection Available",
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      checkConnectivity(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.all(15),
                        minimumSize: const Size(double.infinity, 20)),
                    child: const Text("Retry",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ));
}

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: CustomNavigationHelper.router,
    );
  }
}
