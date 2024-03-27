import 'package:flutter/material.dart';

import '../../../../common/colors.dart';
import '../../../../core/constants/constants.dart';

class GameListItem extends StatefulWidget {
  const GameListItem({super.key});

  @override
  State<StatefulWidget> createState() => _GameListItem();
}

class _GameListItem extends State<GameListItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 300,
            child: Column(
              children: [
                Card(
                    margin: const EdgeInsets.all(18),
                    color: AppColors.itemColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          width: 350,
                          height: 300,
                          AppStrings.gameThumbnailPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Container(
                    width: 350,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: AppColors.itemColor,
                        border: Border.all(color: AppColors.backgroundColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Solitaire - The Cards\nGames",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20)),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.pinkColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(color: Colors.white70))),
                            child: const Text("Play",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16))),
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
