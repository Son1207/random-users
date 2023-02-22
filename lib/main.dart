import 'dart:convert';
import 'package:tinder_app/models/user.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'modules/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: const Color(0xff131e30),
        textTheme: Theme.of(context)
            .textTheme
      ),
      home: Home (),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Applying get request.

  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    String url = "https://randomuser.me/api/0.4/?randomapi";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
        index: singleUser["index"],
          first: singleUser["first"],
          last: singleUser["last"],
          email: singleUser["email"],
          phone: singleUser["phone"],
          gender: singleUser["gender"]);

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Http Get Request."),
          leading:const Icon(
            Icons.get_app,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext context , AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Text('No API');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(snapshot.data[index].first),
                    contentPadding: EdgeInsets.only(bottom: 20.0),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}






