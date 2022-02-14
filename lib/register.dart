import 'dart:convert';

import 'package:auth/person.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  Person person = Person("", "");
  String url = "http://10.241.107.149:8080/persons";

  Future save() async {
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'id':person.id,'login': person.login, 'password': person.password}));
    print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height:MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/arabesque.jpg"),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 5))
                    ],

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text("Register",
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
                            "Email",
                            style: GoogleFonts.redressed(
                              // fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color.fromRGBO(0, 0, 0, 0.8),
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
                              return 'Email is Empty';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 30, color: Colors.black),
                          decoration: InputDecoration(
                              errorStyle:
                              TextStyle(fontSize: 20, color: Colors.black),

                              hintText: "Enter your login",
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
                              color: Color.fromRGBO(0, 0, 0, 0.8),
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
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Already have Account ?",
                              style: GoogleFonts.redressed(
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
                          child:
                          TextButton(

                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(StadiumBorder())
                                ,
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.teal),

                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  save();
                                }
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

              ],
            )),
      ),
    );
  }
}
