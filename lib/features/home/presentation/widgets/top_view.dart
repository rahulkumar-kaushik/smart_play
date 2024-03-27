import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:just_play/common/colors.dart';
import 'package:just_play/core/constants/constants.dart';
import 'package:just_play/features/home/presentation/bloc/states/home_state.dart';
import 'package:just_play/features/home/presentation/pages/screens/rewards_page.dart';
import 'package:just_play/features/home/presentation/widgets/shape_tool.dart';

import '../../../../common/app_constant.dart';

Widget progressView(
    BuildContext context, int lpaPoints, int totalPoints, UserListState state) {
  double progressPercentage = lpaPoints / totalPoints;
  return Container(
    padding: const EdgeInsets.all(4),
    child: Stack(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: coinView(
                    context, lpaPoints, totalPoints, progressPercentage, state),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: cashOutCard(context),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 73,
          left: 130,
          right: 130,
          child: Container(
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  border: Border.all(color: AppColors.backgroundColor),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(2),
              child: Center(
                child: CountdownTimer(
                    endTime: cashoutTime,
                    widgetBuilder: (_, time) {
                      if (time == null) {
                        return const Text("Time's Up!",
                            style: TextStyle(color: Colors.white));
                      } else {
                        var hours = time.hours ?? 00;
                        return Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    size: 12,
                                    Icons.timer,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${hours.toString().padLeft(2, '0')} h ${time.min.toString().padLeft(2, '0')} m",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                            ));
                      }
                    }),
              )),
        ),
      ],
    ),
  );
}

Widget cashOutCard(BuildContext context) {
  String currencySymbol = getCurrency();
  return Card(
    color: AppColors.itemColor,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.backgroundColor,
                      border:
                          Border.all(color: Colors.deepPurpleAccent, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "0.06 $currencySymbol",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 20),
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RewardsPage()));
                  },
                  child: const Text("${AppStrings.donate}!",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 20),
                        backgroundColor: AppColors.pinkColor,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    onPressed: () {},
                    child: const Text("${AppStrings.cashout}!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        textAlign: TextAlign.center)),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget coinView(BuildContext context, int lpaPoints, int totalPoints,
    double progressPercentage, UserListState state) {
  final GlobalKey<TooltipState> toolTipKey = GlobalKey<TooltipState>();

  return Card(
    color: AppColors.itemColor,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.backgroundColor,
                          border:
                              Border.all(color: Colors.transparent, width: 2)),
                      child: Column(
                        children: [
                          const Text(
                            AppStrings.yourCashPoint,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$lpaPoints / $totalPoints",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              _refreshLoader(state)
                            ],
                          ),
                        ],
                      ),
                    )),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: Tooltip(
                    richMessage: WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          constraints: const BoxConstraints(maxWidth: 180),
                          child: const Text(
                            AppStrings.goalTooltipMsg,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 9),
                            textAlign: TextAlign.start,
                          ),
                        )),
                    key: toolTipKey,
                    preferBelow: true,
                    verticalOffset: 40,
                    decoration: const ShapeDecoration(
                        color: Colors.black,
                        shape: ToolTipCustomShape(usePadding: true)),
                    child: InkWell(
                      onTap: () {
                        toolTipKey.currentState?.ensureTooltipVisible();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                            gradient: const LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter
                            ,colors: [
                              Colors.greenAccent,
                              Colors.lightBlueAccent,
                              Colors.blue
                            ]),
                            border: Border.all(
                                color: Colors.transparent, width: 2)),
                        child: Column(
                          children: [
                            const Text(
                              AppStrings.bonusPoint,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              "$totalPoints",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 115,
              right: 0,
              child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.itemColor),
                  margin: const EdgeInsets.all(9),
                  child: const Icon(
                    Icons.add_circle,
                    color: Colors.blue,
                  )),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 10),
            child: Text(
              "Collect $totalPoints points to win bonus points",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    ),
  );
}

Widget _refreshLoader(UserListState state) {
  if (state is UserListLoading) {
    return Container(
        padding: const EdgeInsets.all(5),
        width: 20,
        height: 20,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.blue,
        ));
  } else {
    return const Center(
        child: Icon(
      size: 20,
      Icons.refresh,
      color: Colors.white,
    ));
  }
}
