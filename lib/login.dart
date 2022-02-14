import 'dart:convert';

import 'package:auth/dashboard.dart';
import 'package:auth/person.dart';
import 'package:auth/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  Person person = Person("", "");
  String loginUrl = "http://10.241.107.149:8080/login";
  String showUrl= "http://10.241.107.149:8080/persons";
  Future login() async {
    var res = await http.post(loginUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'id': person.id,
          'login': person.login,
          'password': person.password
        }));
    var data=jsonDecode(res.body);
    print(data["login"]);
    if (res.statusCode == 200) {
      if (data["login"]==person.login && data["password"]==person.password ) {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ));

      }

    }
    else {
      throw Exception('Failed to connect');
    }
  }
  show() async{
    var res= await http.get(showUrl).then((value) {
      var data=jsonDecode(value.body);
      for(int i = 0;i<=value.body.length+1;i++){
        print( data[i]["login"]);
      }


    } );

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children:<Widget>[
                    Container(
                      height:MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/arabesque.jpg"),
                        fit: BoxFit.cover,
                      ),
                      //color: Color.fromRGBO(233, 65, 82, 1),
                      /*boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 5))
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(20)),*/
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Text("Login",
                              style: GoogleFonts.redressed(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Colors.black,
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "UserName",
                              style: GoogleFonts.redressed(
                                // fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: TextEditingController(text: person.login),
                            onChanged: (val) {
                              person.login = val;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password is Empty';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 30, color: Colors.black),
                            decoration: InputDecoration(
                                errorStyle:
                                TextStyle(fontSize: 20, color: Colors.black),

                                hintText: "Enter  login",
                                hintStyle: const TextStyle(color: Colors.grey),

                                filled: true,
                                fillColor:  Color.fromRGBO(255, 255, 255, 0.4),

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.teal)
                                )
                            ),
                          ),

                          SizedBox(
                            height: 60,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Password",
                              style: GoogleFonts.redressed(
                                // fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextFormField(
                            obscureText: true,
                            controller:
                                TextEditingController(text: person.password),
                            onChanged: (val) {
                              person.password = val;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Email is Empty';
                              }
                              return null;
                            },
                            style: TextStyle(fontSize: 30, color: Colors.black),
                            decoration: InputDecoration(
                                errorStyle:
                                    TextStyle(fontSize: 20, color: Colors.black),

                                hintText: "Enter your Password",
                                hintStyle: const TextStyle(color: Colors.grey),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.teal,
                                ),
                                filled: true,
                                fillColor:  Color.fromRGBO(255, 255, 255, 0.4),

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.teal)
                                )
                            ),
                          ),

                          SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                              child: Text(
                                "Dont have Account ?",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 90,
                            width: 90,
                            child: TextButton(

                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(StadiumBorder())
                                  ,
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.teal),

                                ),
                                onPressed: () {
                                  //show();
                                 login();
                                 /* if (_formKey.currentState.validate()) {
                                    //save();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Dashboard(),
                                        ));
                                  }*/
                                },

                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.teal,
                                  size: 30,
                                )),
                          )

                        ],
                      ),
                    ),
                  ),
               ] ),

              ],
            )),
      ),
    );
  }
}
