import 'package:flutter/material.dart';
import 'package:random_x/random_x.dart';

class User_page extends StatelessWidget {
  const User_page({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;


    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top:0,
            left: 0,
            right: 0,
            bottom:500,
            child: Container(
              color: Colors.black,
            ),
          ),
          Positioned(
            top:60,
            left: 20,
            right: 20,
            bottom:60,
            child: Container(
                color: Colors.brown,

                padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: size.height / 10,
                      backgroundImage: const NetworkImage(
                          "https://xsgames.co/randomusers/avatar.php?g=male"),

                    ),

                    const Padding(
                      padding:EdgeInsets.only(top: 30),
                      child: Text(
                        'Hi, My name is',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey),
                      ),
                    ),
                    const Padding(
                      padding:EdgeInsets.only(top: 20),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(RndX.randomCompletePersonDetails().name,style: TextStyle(fontSize: 28, color: Colors.black) ,),
                      ],
                    )
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
