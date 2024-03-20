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
import 'package:just_play/navigation/custom_helper.dart';

import 'common/app_constant.dart';
import 'core/di/injector.dart';

Future<void> main() async {
  CustomNavigationHelper.instance;
  init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => sl<UserListBloc>()..add(FetchUsers()),
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

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  bool serviceStatus = false;
  bool hasPermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";

  @override
  void initState() {
    checkGps();
    checkConnectivity();
    super.initState();

    Timer(const Duration(seconds: 5), () {
      isConnected
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const NavScreen()))
          : _showNetworkErrorDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.lightBlueAccent, Colors.blue])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/justplay.png',
                height: 80,
                width: 130,
                color: Colors.white,
              ),
            ]),
      ),
    );
  }

  checkGps() async {
    serviceStatus = await Geolocator.isLocationServiceEnabled();
    if (serviceStatus) {
      permission = await Geolocator.checkPermission();
    }
  }
}

checkConnectivity() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult != ConnectivityResult.none) {
    isConnected = true;
  } else {
    isConnected = false;
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
                      checkConnectivity();
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
