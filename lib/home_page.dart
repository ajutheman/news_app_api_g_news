import 'package:flutter/material.dart';
import 'package:newsapp/ts.dart';

import 'Widgets/curved_bottom_container.dart';
import 'Widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CurvedBottomContainer(),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Where Information Meets Interaction',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Navigate through the digital news landscape effortlessly with our clean and distraction-free login interface. Gain access to news that demands your attention without any visual noise',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    SizedBox(height: 50),
                    SizedBox(
                      height: 50,
                      width: 330,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: ContinuousRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Ts(),
                                //LoginPage(),
                                //FristPage(),
                              ));
                        },
                        child: Text('Get Started',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    TextWidget(
                      text: "  ",
                      fontSize: 14,
                      onPressed: () {
                        print("123");
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
