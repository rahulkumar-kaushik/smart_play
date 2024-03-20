import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:just_play/common/app_constant.dart';
import 'package:just_play/core/constants/constants.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/reward_bg.png"),
                fit: BoxFit.fill,
                scale: 0.1),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlueAccent, Colors.blueAccent])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppStrings.thanksForPlaying,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Card(
                elevation: 10,
                surfaceTintColor: Colors.white,
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "PLNO.03",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 55),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 20),
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          onPressed: () {
                            _dialogOpen(context);
                          },
                          child: const Text("${AppStrings.cashout}!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              textAlign: TextAlign.center)),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.all(15),
                        minimumSize: const Size(double.infinity, 20)),
                    child: const Text(AppStrings.pastRewards,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        textAlign: TextAlign.center),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const Text(
                  AppStrings.nextCashout,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(width: 10,),
                  CountdownTimer(
                    endTime: cashoutTime,
                    textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Future _dialogOpen(BuildContext context) {
  String currencySymbol = getCurrency();
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) =>
          Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                          "Earnings: 0.06 $currencySymbol",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w900),
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close)),
                  ],
                ),
                const Text(
                  "Choose your favorite provider",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _showCashoutDetailsDialog(context, "paypal");
                              },
                              icon: const Icon(Icons.paypal)),
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2)),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _showCashoutDetailsDialog(context, "Amazon");
                              },
                              icon: const Icon(Icons.paypal)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Or donate to a charity",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5,
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.paypal)),
                    ),
                    Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _showCashoutDetailsDialog(context, null);
                          },
                          icon: const Icon(Icons.paypal_sharp)),
                    )
                  ],
                ),
                const Divider(
                  height: 5,
                  thickness: 4,
                  indent: 0,
                  endIndent: double.infinity,
                )
              ],
            ),
          ));
}

Future _showCashoutDetailsDialog(BuildContext context, String? name) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) =>
          Dialog(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                          child: Text(
                            "Provide your details",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w900),
                          )),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: (name == null)
                            ? "Email*: "
                            : "Email of your $name account*",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "First and last name*",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Address*",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        padding: const EdgeInsets.all(15),
                        minimumSize: const Size(double.infinity, 20)),
                    child: const Text("CASH OUT!",
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
