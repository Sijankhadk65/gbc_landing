import 'package:flutter/material.dart';
import 'package:gbc_landing/widgets/modal_card.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({
    super.key,
    required this.appConstraints,
  });

  final BoxConstraints appConstraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.fromSize(
            size: Size.fromHeight(
              appConstraints.maxWidth > 450 ? 60 : 60,
            ),
          ),
          Text(
            "THIS IS THE OVERVIEW OF OUR GROWING NETWORK",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Jiho",
              fontSize: appConstraints.maxWidth > 450 ? 35 : 15.5,
              color: const Color(0xFF00963F),
            ),
          ),
          Text(
            "OF UNIQUE MOBILITY COMPANIES & SOLUTIONS.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Jiho",
              fontSize: appConstraints.maxWidth > 450 ? 35 : 15.5,
              color: const Color(0xFF00963F),
            ),
          ),
          SizedBox.fromSize(
            size: Size.fromHeight(
              appConstraints.maxWidth > 450 ? 50 : 0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: appConstraints.maxWidth > 450 ? 100 : 0,
              right: appConstraints.maxWidth > 450 ? 100 : 0,
            ),
            child: Container(
              height: appConstraints.maxWidth > 450
                  ? appConstraints.maxHeight - 338
                  : appConstraints.maxHeight,
              // width: constraints.maxWidth * 0.8,
              child: Flex(
                direction: appConstraints.maxWidth > 450
                    ? Axis.horizontal
                    : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ModalCard(
                      asset: "assets/pics/lap1.png",
                      description:
                          "Egestas netus aliquet ornare egestas orci, lectus pretium ac commodo. Amet, cursus scelerisque lectus tristique morbi non donec. Vitae egestas mauris, adipiscing nulla. Lorem neque amet faucibus in. Fermentum egestas.",
                      label: "company-bike.com",
                      appConstraints: appConstraints,
                    ),
                  ),
                  Expanded(
                    child: ModalCard(
                      asset: "assets/pics/lap2.png",
                      description:
                          "Nullam quam lobortis mauris neque, ut dictum. Elementum felis molestie dui eget. Sollicitudin diam etiam magna pretium fermentum nam. Lorem netus cursus est pharetra pellentesque nulla bibendum. Neque.",
                      label: "mein-dienstrad.de",
                      appConstraints: appConstraints,
                    ),
                  ),
                  Expanded(
                    child: ModalCard(
                      asset: "assets/pics/lap3.png",
                      description:
                          "Id metus, condimentum rhoncus, risus, enim, id facilisis suscipit dictum. Vel turpis eget convallis urna. Tristique tellus id curabitur ut. Sit urna imperdiet sapien rhoncus dictum sem ut amet. Faucibus nulla posuere eget at.",
                      label: "green-bicycle.club",
                      appConstraints: appConstraints,
                    ),
                  ),
                  Expanded(
                    child: ModalCard(
                      asset: "assets/pics/lap4.png",
                      description:
                          "Id metus, condimentum rhoncus, risus, enim, id facilisis suscipit dictum. Vel turpis eget convallis urna. Tristique tellus id curabitur ut. Sit urna imperdiet sapien rhoncus dictum sem ut amet. Faucibus nulla posuere eget at.",
                      label: "mobiler-bike-service.com",
                      appConstraints: appConstraints,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
