import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalCard extends StatelessWidget {
  const ModalCard({
    super.key,
    required this.asset,
    required this.description,
    required this.label,
    required this.appConstraints,
  });

  final String asset, description, label;
  final BoxConstraints appConstraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
      ),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(asset),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: appConstraints.maxWidth > 800
                    ? 50 - (appConstraints.maxWidth / 500)
                    : 80,
                right: appConstraints.maxWidth > 800
                    ? 50 - (appConstraints.maxWidth / 500)
                    : 80,
                // top: appConstraints.maxWidth > 450 ? 0 : 30,
              ),
              child: Text(
                appConstraints.maxWidth > 800
                    ? description
                    : "${description.substring(0, 100)}...",
                style: GoogleFonts.barlow(
                  fontWeight: FontWeight.w300,
                  fontSize: appConstraints.maxWidth > 800
                      ? 13 - (appConstraints.maxWidth / 800)
                      : 9,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontFamily: "Jiho",
                fontSize: appConstraints.maxWidth > 800
                    ? 20 - (appConstraints.maxWidth / 800)
                    : 10,
                fontWeight: FontWeight.w300,
                color: const Color(0xFF00963F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
