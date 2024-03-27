part of '../../main.dart';

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

    super.initState();

    Timer(const Duration(seconds: 5), () {
      checkGps();
      checkConnectivity(context);
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
    LocationPermission permission = await Geolocator.requestPermission();

    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    if (serviceStatus) {
      permission = await Geolocator.checkPermission();
      if(permission==LocationPermission.denied) {
        if (kDebugMode) {
          print("Location denied: ${Geolocator.getCurrentPosition()}");
        }
      } else if(permission==LocationPermission.deniedForever) {
        if (kDebugMode) {
          print("Location forever: ${Geolocator.getCurrentPosition()}");
        }
      } else {
        await Geolocator.getCurrentPosition();
        if (kDebugMode) {
          print("Location: $position");
        }
      }
    }
  }
}

_goNext(BuildContext context) {
  var isOnboarded = SharedPrefsUtils.getBool("onboarded");
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              isOnboarded ? const NavScreen() : const OnBoardingPage()));
}

