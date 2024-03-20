import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_play/core/constants/constants.dart';
import 'package:just_play/features/home/presentation/widgets/shape_tool.dart';

import '../../../../common/app_constant.dart';

Widget progressView(BuildContext context, int lpaPoints, int totalPoints) {
  double progressPercentage = lpaPoints / totalPoints;
  return Container(
    padding: const EdgeInsets.all(4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: coinView(context, lpaPoints, totalPoints, progressPercentage),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: cashOutCard(context),
        )
      ],
    ),
  );
}

Widget cashOutCard(BuildContext context) {
  String currencySymbol = getCurrency();
  return Card(
    elevation: 10,
    surfaceTintColor: Colors.white,
    margin: const EdgeInsets.all(8),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "${AppStrings.coinsConverted} 15m 17s",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "0.06 $currencySymbol",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 20),
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    onPressed: () {},
                    label: const Text("${AppStrings.donate}!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        textAlign: TextAlign.center),
                    icon: const Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 20),
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    onPressed: () {},
                    child: const Text("${AppStrings.cashout}!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
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
    double progressPercentage) {
  final GlobalKey<TooltipState> toolTipKey = GlobalKey<TooltipState>();
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 150,
          child: Card(
            margin: const EdgeInsets.all(10),
            surfaceTintColor: Colors.white,
            elevation: 10,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Text(
                      "SmartPlay Coins:",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$lpaPoints",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          'assets/images/coins.png',
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Tooltip(
          richMessage: WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: Container(
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(maxWidth: 250),
                child: const Text(
                  AppStrings.goalTooltipMsg,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )),
          decoration: const ShapeDecoration(
              color: Colors.blue, shape: ToolTipCustomShape(usePadding: true)),
          key: toolTipKey,
          preferBelow: true,
          verticalOffset: 70,
          child: InkWell(
            onTap: () {
              toolTipKey.currentState?.ensureTooltipVisible();
            },
            child: SizedBox(
              height: 150,
              child: Card(
                elevation: 10,
                margin: const EdgeInsets.all(10),
                surfaceTintColor: Colors.white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrings.goalTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+ $lpaPoints",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Image.asset(
                                'assets/images/coins.png',
                                height: 18,
                                width: 18,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Icon(Icons.info_outline_rounded),
                          ],
                        ),
                      ),
                      Text(
                        lpaPoints > 1
                            ? "Goal: $totalPoints"
                            : AppStrings.goalReached + totalPoints.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 10),
                        textAlign: TextAlign.end,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 5),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: LinearProgressIndicator(
                                  value: progressPercentage, // 70% progress
                                  backgroundColor: Colors.grey[300],
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Colors.blue),
                                  minHeight: 10.0, // Minimum height of the line
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
