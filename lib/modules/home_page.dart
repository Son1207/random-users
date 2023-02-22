import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tinder_app/widget/gradient_text.dart';
import 'package:tinder_app/widget/gradient_icon.dart';
import 'package:tinder_app/modules/users_page.dart';
import 'package:tinder_app/modules/birthday_page.dart';
import 'package:tinder_app/modules/address_page.dart';
import 'package:tinder_app/modules/contact_page.dart';
import 'package:tinder_app/modules/password_page.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {


  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const User_page();


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.black,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: [
                  MaterialButton(
                    minWidth: 80,
                    onPressed: () {
                      setState(() {
                        currentScreen = const User_page();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 0
                            ? const GradientIcon(
                          Icons.person_outline,
                          30,
                          LinearGradient(
                            colors: <Color>[
                              Color(0xff8AD4EC),
                              Color(0xffEF96FF),
                              Color(0xffFF56A9),
                              Color(0xffFFAA6C),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        )
                            : const Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                        ),
                        currentTab == 0
                            ? const GradientText(
                          '',
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff8AD4EC),
                              Color(0xffEF96FF),
                              Color(0xffFF56A9),
                              Color(0xffFFAA6C),
                            ],
                          ),
                        )
                            : const Text(
                          '',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Birthday_page();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 1
                            ? const GradientIcon(
                          Icons.calendar_month,
                          30,
                          LinearGradient(
                            colors: <Color>[
                              Color(0xff8AD4EC),
                              Color(0xffEF96FF),
                              Color(0xffFF56A9),
                              Color(0xffFFAA6C),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        )
                            : const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                        currentTab == 1
                            ? const GradientText(
                          '',
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff8AD4EC),
                              Color(0xffEF96FF),
                              Color(0xffFF56A9),
                              Color(0xffFFAA6C),
                            ],
                          ),
                        )
                            : const Text(
                          '',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Address_page();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 2
                            ? const GradientIcon(
                          Icons.place_outlined,
                          30,
                          LinearGradient(
                            colors: <Color>[
                              Color(0xff8AD4EC),
                              Color(0xffEF96FF),
                              Color(0xffFF56A9),
                              Color(0xffFFAA6C),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        )
                            : const Icon(
                          Icons.place_outlined,
                          color: Colors.grey,
                        ),
                        currentTab == 2
                            ? const GradientText(
                          '',
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff8AD4EC),
                              Color(0xffEF96FF),
                              Color(0xffFF56A9),
                              Color(0xffFFAA6C),
                            ],
                          ),
                        )
                            : const Text(
                          '',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Contact_page();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 3
                            ? const GradientIcon(
                          Icons.phone,
                          30,
                          LinearGradient(
                            colors: <Color>[
                              Color(0xff8AD4EC),
                              Color(0xffEF96FF),
                              Color(0xffFF56A9),
                              Color(0xffFFAA6C),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        )
                            : const Icon(
                          Icons.phone,
                          color: Colors.grey,
                        ),
                        currentTab == 3
                            ? const GradientText(
                          '',
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff8AD4EC),
                              Color(0xffEF96FF),
                              Color(0xffFF56A9),
                              Color(0xffFFAA6C),
                            ],
                          ),
                        )
                            : const Text(
                          '',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 60,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Password_page();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 4
                            ? const GradientIcon(
                          Icons.lock,
                          30,
                          LinearGradient(
                            colors: <Color>[
                              Color(0xff8AD4EC),
                              Color(0xffEF96FF),
                              Color(0xffFF56A9),
                              Color(0xffFFAA6C),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        )
                            : const Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        currentTab == 4
                            ? const GradientText(
                          '',
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff8AD4EC),
                              Color(0xffEF96FF),
                              Color(0xffFF56A9),
                              Color(0xffFFAA6C),
                            ],
                          ),
                        )
                            : const Text(
                          '',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




