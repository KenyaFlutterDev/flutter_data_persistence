import 'package:flutter/material.dart';
import 'package:flutterdatapersistence/daos/user_dao.dart';
import 'package:flutterdatapersistence/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetrieveDetails extends StatefulWidget {
  @override
  _RetrieveDetailsState createState() => _RetrieveDetailsState();
}

class _RetrieveDetailsState extends State<RetrieveDetails> {
  String name = "Dummy";
  String email = "Dummy Email";

  User details;

  @override
  void initState() {
    // fetch details from shared preferences
    fetchDetailsFromSF();

    // fetch user details from DB
    fetchDetailsFromDB();
    super.initState();
  }

/*
  fetchDetailsFromSF() async {
    // get SF instance
    SharedPreferences preferences = await SharedPreferences.getInstance();

    // fetch name from SF
    String fetchedname = preferences.getString('username') ?? null;

    // fetch email from SF
    String fetchedEmail = preferences.getString('email');

    setState(() {
      name = fetchedname;
      email = fetchedEmail;
    });
  }
*/

  fetchDetailsFromDB() async {
    User user = await UserDao().fetchUserByEmail('kasremuia@gmail.com');

    if (user != null) {
      setState(() {
        details = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('My name is ${details.name}'),
            Text('My email is ${details.email}'),
          ],
        ),
      )),
    );
  }
}
