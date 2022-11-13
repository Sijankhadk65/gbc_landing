import 'package:flutter/material.dart';

class CarosuelItem extends StatelessWidget {
  const CarosuelItem({
    Key? key,
    required this.asset,
    required this.label_1,
    required this.label_2,
    required this.fontSize,
    required this.padding,
  }) : super(key: key);

  final String asset;
  final String label_1;
  final String label_2;
  final double fontSize;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(
                110,
                0,
                150,
                63,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 25,
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth > 450
                    ? constraints.maxWidth * 0.4
                    : constraints.maxWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label_1,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: Colors.white,
                        fontFamily: "Jiho",
                      ),
                    ),
                    Text(
                      label_2,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: Colors.white,
                        fontFamily: "Jiho",
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
