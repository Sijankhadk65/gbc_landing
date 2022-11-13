import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({
    Key? key,
    required this.appConstraints,
  }) : super(key: key);

  final BoxConstraints appConstraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Flex(
        direction:
            appConstraints.maxWidth > 450 ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(
                50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "What we do?",
                    style: TextStyle(
                      fontFamily: "Jiho",
                      fontSize: appConstraints.maxWidth > 450 ? 35 : 22.5,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "Under the roof of the Green Mobility Holding we will",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.barlow(
                      fontWeight: FontWeight.w300,
                      fontSize: appConstraints.maxWidth > 450 ? 25 : 14.5,
                    ),
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(
                      5,
                    ),
                  ),
                  Text(
                    "unite leading Mobility Service Providers &",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.barlow(
                      fontWeight: FontWeight.w300,
                      fontSize: appConstraints.maxWidth > 450 ? 25 : 14.5,
                    ),
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(
                      5,
                    ),
                  ),
                  Text(
                    "Entrepreneurs from around the World….",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.barlow(
                      fontWeight: FontWeight.w300,
                      fontSize: appConstraints.maxWidth > 450 ? 25 : 14.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/pics/wed.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
