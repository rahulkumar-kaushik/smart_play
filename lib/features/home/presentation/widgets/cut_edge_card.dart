import 'package:flutter/material.dart';

class CuttingEdgeBox extends StatelessWidget {
  const CuttingEdgeBox({super.key});

  @override
  Widget build(BuildContext context) => cuttingEdgeBox();
}

Widget cuttingEdgeBox() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: const Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
            ],
          ),
          Positioned(
            bottom: -20,
            top:-10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
            ),
          )
        ],
      ),
    ),
  );
}
