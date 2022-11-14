import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:gbc_landing/bloc/contact_from_bloc.dart';
import 'package:gbc_landing/section/first_section.dart';
import 'package:gbc_landing/section/second_section.dart';
import 'package:gbc_landing/section/site_carousel.dart';
import 'package:gbc_landing/section/third_section.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _carouselController = CarouselController();
  PageController? _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (
      context,
      constraints,
    ) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          leading: Container(),
          title: Row(
            // direction: Axis.horizontal,
            children: [
              Image.asset(
                'assets/png/logo.png',
                fit: BoxFit.contain,
                height: 50,
              ),

              const Spacer(),

              ...constraints.maxWidth > 450
                  ? [
                      InkWell(
                        onTap: () {
                          _pageController!.jumpToPage(
                            3,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Kontakt",
                            style: TextStyle(
                              fontFamily: "Jiho",
                              color: currentPage == 3
                                  ? Colors.green
                                  : Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Impressum",
                            style: TextStyle(
                              fontFamily: "Jiho",
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "ABGs",
                            style: TextStyle(
                              fontFamily: "Jiho",
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ]
                  : [],
              // SizedBox.fromSize(size: const Size(50, 50))
            ],
          ),
          actions: constraints.maxWidth > 450
              ? [
                  const Icon(
                    Elusive.facebook,
                    color: Color.fromARGB(
                      127,
                      87,
                      86,
                      86,
                    ),
                    size: 15,
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromWidth(
                      10,
                    ),
                  ),
                  const Icon(
                    Elusive.instagram,
                    color: Color.fromARGB(
                      127,
                      87,
                      86,
                      86,
                    ),
                    size: 15,
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromWidth(
                      10,
                    ),
                  ),
                  const Icon(
                    Elusive.pinterest,
                    color: Color.fromARGB(
                      127,
                      87,
                      86,
                      86,
                    ),
                    size: 15,
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromWidth(
                      10,
                    ),
                  ),
                  const Icon(
                    Elusive.twitter,
                    color: Color.fromARGB(
                      127,
                      87,
                      86,
                      86,
                    ),
                    size: 15,
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromWidth(
                      20,
                    ),
                  ),
                ]
              : [
                  PopupMenuButton(
                    // color: Colors.black,
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    itemBuilder: (context) => <PopupMenuItem<String>>[
                      PopupMenuItem(
                        value: "kontakt",
                        onTap: () {
                          _pageController!.jumpToPage(
                            3,
                          );
                        },
                        child: Text(
                          "Kontakt",
                          style: TextStyle(
                            fontFamily: "Jiho",
                            color:
                                currentPage == 3 ? Colors.green : Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const PopupMenuItem(
                        value: "impressum",
                        child: Text(
                          "Impressum",
                          style: TextStyle(
                            fontFamily: "Jiho",
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const PopupMenuItem(
                        value: "kontakt",
                        child: Text(
                          "ABGs",
                          style: TextStyle(
                            fontFamily: "Jiho",
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
        ),
        body: constraints.maxWidth > 450
            ? PageView(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                // pageSnapping: true,
                onPageChanged: ((value) {
                  setState(() {
                    currentPage = value;
                  });
                }),
                children: [
                  SiteCarousel(
                    carouselController: _carouselController,
                    appConstraints: constraints,
                  ),
                  FirstSection(
                    appConstraints: constraints,
                  ),
                  SecondSection(
                    appConstraints: constraints,
                  ),
                  Provider(
                    create: ((context) => ContactFormBloc()),
                    // dispose: ((context, ContactFormBloc bloc) =>
                    //     bloc.dispose()),
                    child: ThirdSection(
                      appConstraints: constraints,
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: constraints.maxHeight,
                      child: SiteCarousel(
                        carouselController: _carouselController,
                        appConstraints: constraints,
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight,
                      child: FirstSection(
                        appConstraints: constraints,
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight + 98,
                      child: SecondSection(
                        appConstraints: constraints,
                      ),
                    ),
                    Provider(
                      create: ((context) => ContactFormBloc()),
                      // dispose: ((context, ContactFormBloc bloc) =>
                      //     bloc.dispose()),
                      child: Container(
                        height: constraints.maxHeight,
                        child: ThirdSection(
                          appConstraints: constraints,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
