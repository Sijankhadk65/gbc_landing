import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        leading: Container(),
        title: Row(
          children: [
            Image.asset(
              'assets/png/logo.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            const Spacer(),
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
                    color: currentPage == 3 ? Colors.green : Colors.black,
                    fontSize: 15,
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
                    fontSize: 15,
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
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Elusive.facebook,
              color: Colors.grey,
              size: 10,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Elusive.instagram,
              color: Colors.grey,
              size: 10,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Elusive.pinterest,
              color: Colors.grey,
              size: 10,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Elusive.twitter,
              color: Colors.grey,
              size: 10,
            ),
          ),
        ],
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        pageSnapping: true,
        onPageChanged: ((value) {
          setState(() {
            currentPage = value;
          });
        }),
        children: [
          SiteCarousel(carouselController: _carouselController),
          const FirstSection(),
          SecondSection(),
          const ThirdSection(),
        ],
      ),
    );
  }

  Container SecondSection() {
    return Container(
      child: Column(
        children: [
          const Text(
            "THIS IS THE OVERVIEW OF OUR GROWING NETWORK",
            style: TextStyle(
              fontFamily: "Jiho",
              fontSize: 35,
              color: Color(0xFF00963F),
            ),
          ),
          const Text(
            "OF UNIQUE MOBILITY COMPANIES & SOLUTIONS.",
            style: TextStyle(
              fontFamily: "Jiho",
              fontSize: 35,
              color: Color(0xFF00963F),
            ),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(
              50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth * 0.8,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: modalCard(
                        "assets/pics/lap1.png",
                        "Egestas netus aliquet ornare egestas orci, lectus pretium ac commodo. Amet, cursus scelerisque lectus tristique morbi non donec. Vitae egestas mauris, adipiscing nulla. Lorem neque amet faucibus in. Fermentum egestas.",
                        "company-bike.com",
                      ),
                    ),
                    Expanded(
                      child: modalCard(
                        "assets/pics/lap2.png",
                        "Nullam quam lobortis mauris neque, ut dictum. Elementum felis molestie dui eget. Sollicitudin diam etiam magna pretium fermentum nam. Lorem netus cursus est pharetra pellentesque nulla bibendum. Neque.",
                        "mein-dienstrad.de",
                      ),
                    ),
                    Expanded(
                      child: modalCard(
                        "assets/pics/lap3.png",
                        "Id metus, condimentum rhoncus, risus, enim, id facilisis suscipit dictum. Vel turpis eget convallis urna. Tristique tellus id curabitur ut. Sit urna imperdiet sapien rhoncus dictum sem ut amet. Faucibus nulla posuere eget at.",
                        "green-bicycle.club",
                      ),
                    ),
                    Expanded(
                      child: modalCard(
                        "assets/pics/lap4.png",
                        "Id metus, condimentum rhoncus, risus, enim, id facilisis suscipit dictum. Vel turpis eget convallis urna. Tristique tellus id curabitur ut. Sit urna imperdiet sapien rhoncus dictum sem ut amet. Faucibus nulla posuere eget at.",
                        "mobiler-bike-service.com",
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

  Widget modalCard(String asset, String description, String label) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(asset),
              ),
            ),
          ),
          Text(
            description,
            style: GoogleFonts.barlow(
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(
              15,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontFamily: "Jiho",
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Color(0xFF00963F),
            ),
          )
        ],
      ),
    );
  }
}

class ThirdSection extends StatelessWidget {
  const ThirdSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/pics/kon.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "GET IN TOUCH",
                  style: TextStyle(
                    fontFamily: "Jhio",
                    fontSize: 35,
                    color: Color(0xFF00963F),
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size.fromHeight(
                    10,
                  ),
                ),
                Text(
                  "Green Mobility Holding GmbH",
                  style: GoogleFonts.barlow(
                    fontWeight: FontWeight.w300,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Lorem Ipsum str. 123",
                  style: GoogleFonts.barlow(
                    fontWeight: FontWeight.w300,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "54321 Munich / Gremany",
                  style: GoogleFonts.barlow(
                    fontWeight: FontWeight.w300,
                    fontSize: 25,
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size.fromHeight(50),
                ),
                LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    width: constraints.maxWidth * 0.5,
                    child: Table(
                      border: TableBorder.all(
                        color: Colors.grey,
                        width: 2,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      children: [
                        const TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "You're name",
                                ),
                              ),
                            ),
                          ],
                        ),
                        const TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "You're Email",
                                ),
                              ),
                            ),
                          ],
                        ),
                        const TableRow(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Message",
                                ),
                                minLines: 5,
                                maxLines: 10,
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "SEND",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Jiho",
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FirstSection extends StatelessWidget {
  const FirstSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      50,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "What we do?",
                          style: TextStyle(
                            fontFamily: "Jiho",
                            fontSize: 20,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "Under the roof of the Green Mobility Holding we will",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.barlow(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
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
                            fontSize: 15,
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
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/pics/wed.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SiteCarousel extends StatelessWidget {
  const SiteCarousel({
    Key? key,
    required CarouselController carouselController,
  })  : _carouselController = carouselController,
        super(key: key);

  final CarouselController _carouselController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          disableCenter: true,
          autoPlay: true,
          aspectRatio: 16 / 6.5,
        ),
        carouselController: _carouselController,
        items: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/slider/1.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(100),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "LEADING THE WORLD INTO",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "Jiho",
                        ),
                      ),
                      Text(
                        "A MORE SUSTINABLE MOBILITY",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "Jiho",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/slider/2.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(100),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "FAMES CONDIMENTUM TELLUS",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "TINCIDUNT ID FERMENTUM",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/slider/3.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(100),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "CURSUS MOLLIS DUI LACUS",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "MAURIS MORBI ORNARE LESTIE",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
