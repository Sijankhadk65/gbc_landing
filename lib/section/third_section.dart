import 'package:flutter/material.dart';
import 'package:gbc_landing/bloc/contact_from_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smtpman/port.dart';
import 'package:smtpman/secure.dart';
import 'package:smtpman/smtpman.dart';

class ThirdSection extends StatefulWidget {
  const ThirdSection({
    Key? key,
    required this.appConstraints,
  }) : super(key: key);

  final BoxConstraints appConstraints;

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection> {
  ContactFormBloc? _contactFormBloc;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _contactFormBloc = Provider.of<ContactFormBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.appConstraints.maxWidth > 450
          ? 900
          : widget.appConstraints.maxHeight,
      child: widget.appConstraints.maxWidth > 450
          ? Flex(
              direction: Axis.horizontal,
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
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: StreamBuilder(
                                        stream: _contactFormBloc!.name,
                                        builder: (context, snpashot) {
                                          return TextField(
                                            textAlign: TextAlign.center,
                                            controller: _nameController,
                                            onChanged:
                                                _contactFormBloc!.changeName,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "You're name",
                                              hintStyle: GoogleFonts.barlow(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16,
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: StreamBuilder(
                                        stream: _contactFormBloc!.email,
                                        builder: (context, snapshot) {
                                          return TextField(
                                            textAlign: TextAlign.center,
                                            controller: _emailController,
                                            onChanged:
                                                _contactFormBloc!.changeEmail,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              errorText: !snapshot.hasData &&
                                                      snapshot.hasError
                                                  ? snapshot.error.toString()
                                                  : "",
                                              errorStyle: GoogleFonts.barlow(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                              ),
                                              hintText: "You're Email",
                                              hintStyle: GoogleFonts.barlow(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16,
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: StreamBuilder(
                                        stream: _contactFormBloc!.message,
                                        builder: (context, snapshot) {
                                          return TextField(
                                            textAlign: TextAlign.center,
                                            controller: _messageController,
                                            onChanged:
                                                _contactFormBloc!.changeMessage,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Message",
                                              hintStyle: GoogleFonts.barlow(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16,
                                              ),
                                            ),
                                            minLines: 5,
                                            maxLines: 10,
                                          );
                                        }),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _contactFormBloc!.sendEmail();
                                      _nameController.clear();
                                      _emailController.clear();
                                      _messageController.clear();
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        "SEND",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Jiho",
                                          fontWeight: FontWeight.w300,
                                          fontSize: 25,
                                          color: Color(0xFF00963F),
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
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/pics/kon.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      padding: const EdgeInsets.all(
                        100,
                      ),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "GET IN TOUCH",
                              style: TextStyle(
                                fontFamily: "Jhio",
                                fontSize: widget.appConstraints.maxWidth > 450
                                    ? 35
                                    : 17.5,
                                color: const Color(0xFF00963F),
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
                                fontSize: widget.appConstraints.maxWidth > 450
                                    ? 25
                                    : 12.5,
                              ),
                            ),
                            Text(
                              "Lorem Ipsum str. 123",
                              style: GoogleFonts.barlow(
                                fontWeight: FontWeight.w300,
                                fontSize: widget.appConstraints.maxWidth > 450
                                    ? 25
                                    : 12.5,
                              ),
                            ),
                            Text(
                              "54321 Munich / Gremany",
                              style: GoogleFonts.barlow(
                                fontWeight: FontWeight.w300,
                                fontSize: widget.appConstraints.maxWidth > 450
                                    ? 25
                                    : 12.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(50),
                  ),
                  Expanded(
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Container(
                        width: constraints.maxWidth * 0.8,
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
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: StreamBuilder(
                                      stream: _contactFormBloc!.name,
                                      builder: (context, snapshot) {
                                        return TextField(
                                          controller: _nameController,
                                          textAlign: TextAlign.center,
                                          onChanged:
                                              _contactFormBloc!.changeName,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "You're name",
                                            hintStyle: GoogleFonts.barlow(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: StreamBuilder(
                                      stream: _contactFormBloc!.email,
                                      builder: (context, snapshot) {
                                        return TextField(
                                          textAlign: TextAlign.center,
                                          controller: _emailController,
                                          onChanged:
                                              _contactFormBloc!.changeEmail,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "You're Email",
                                            hintStyle: GoogleFonts.barlow(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: StreamBuilder(
                                      stream: _contactFormBloc!.message,
                                      builder: (context, snapshot) {
                                        return TextField(
                                          textAlign: TextAlign.center,
                                          controller: _messageController,
                                          onChanged:
                                              _contactFormBloc!.changeMessage,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Message",
                                            hintStyle: GoogleFonts.barlow(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16,
                                            ),
                                          ),
                                          minLines: 5,
                                          maxLines: 10,
                                        );
                                      }),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    _contactFormBloc!.sendEmail();
                                    _nameController.clear();
                                    _emailController.clear();
                                    _messageController.clear();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "SEND",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Jiho",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 25,
                                        color: Color(0xFF00963F),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
    );
  }
}
