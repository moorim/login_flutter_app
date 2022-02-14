import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color.fromRGBO(56, 241, 199, 0.49411764705882355),

      ),

      body: SingleChildScrollView(
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
               /* boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Colors.black, offset: Offset(1, 5))
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(20)),*/
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      alignment: Alignment.topRight,
                      child: TextButton(

                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(StadiumBorder())
                            ,
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.teal),

                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            //save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));

                          },

                          child: Icon(
                            Icons.exit_to_app,
                            color: Colors.teal,
                            size: 30,
                          )),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text("Dashboard",
                        style: GoogleFonts.redressed(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: 30,
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
