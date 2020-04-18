import 'package:flutter/material.dart';
import 'package:flutterdatapersistence/daos/user_dao.dart';
import 'package:flutterdatapersistence/models/User.dart';
import 'package:flutterdatapersistence/screens/retrieve_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertDetails extends StatefulWidget {
  @override
  _InsertDetailsState createState() => _InsertDetailsState();
}

class _InsertDetailsState extends State<InsertDetails> {
  // form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // vars to store user info
  String name;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBEBEF),
      body: SafeArea(
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Enter Details',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Form(
                    key: _formKey,
                    autovalidate: true,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            child: TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Name',
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide.none),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.red,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                ),
                                onSaved: (value) {
                                  name = value;
                                }),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            child: TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Email address',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide.none),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.red,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                ),
                                onSaved: (value) {
                                  email = value;
                                }),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            child: TextFormField(
                                autofocus: false,
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'password',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide: BorderSide.none),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.red,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                ),
                                onSaved: (value) {
                                  password = value;
                                }),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            child: ButtonTheme(
                              minWidth: double.infinity,
                              child: MaterialButton(
                                onPressed: () async {
                                  // save form details
                                  _formKey.currentState.save();

                                  /*
                                  // store the in SF
                                  // get the SF instance
                                  SharedPreferences preferences = await SharedPreferences.getInstance();

                                  // store the user details
                                  preferences.setString('username', '$name');
                                  preferences.setString('email', '$email');
                                  preferences.setString('password', '$password');
                                  */

                                  // Store user in db
                                  // create user object
                                  User user = User(
                                    name: name,
                                    email: email,
                                    password: password
                                  );

                                  // insert the user
                                  await UserDao().insertUser(user);

                                  // navigate to next screen
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RetrieveDetails()));
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                textColor: Colors.white,
                                color: Color(0xFFBA7D93),
                                height: 50,
                                elevation: 5,
                                child: Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
