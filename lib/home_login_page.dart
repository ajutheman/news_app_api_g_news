import 'package:flutter/material.dart';
import 'package:newsapp/Widgets/curved_bottom_container.dart';
import 'package:newsapp/register_page.dart';
import 'package:newsapp/ts.dart';

import 'Widgets/custom_search_field.dart';
import 'Widgets/phone_number_felid.dart';

class HomeLoginPage extends StatefulWidget {
  const HomeLoginPage({super.key});

  @override
  State<HomeLoginPage> createState() => _HomeLoginPageState();
}

class _HomeLoginPageState extends State<HomeLoginPage> {
  final phoneCtl = TextEditingController();
  FocusScopeNode? currentFocus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CurvedBottomContainer(),
        ListView(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  // decoration: BoxDecoration(color: Colors.red),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(25),
                  //   color: Colors.white,
                  // ),
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  // width: 950,
                  // height: 360,
                  child: Row(
                    children: [
                      Container(
                        height: 350,
                        width: 340,
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 12, top: 10, right: 10),
                                child: PhoneNumberField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "field empty";
                                      }
                                      return null;
                                    },
                                    controller: phoneCtl,
                                    icon: Icons.phone_android_sharp,
                                    label: "Phone Number")),
                            const Padding(
                                padding: EdgeInsets.only(
                                    left: 12, top: 10, right: 10),
                                child: CustomSearchField(
                                    icon: Icons.password_outlined,
                                    label: "Password")),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 10, top: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(300, 30),
                                  backgroundColor: Colors.black,
                                  shape: const ContinuousRectangleBorder(
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
                                        //MainPage(),
                                        //FristPage(),
                                      ));
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont't have an account?",
                      style: TextStyle(
                        fontSize: 19,
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        letterSpacing: 0.01,
                        wordSpacing: 0.1,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPaage(),
                            ));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 20,
                          // backgroundColor: Colors.white,
                          color: Colors.greenAccent,
                          letterSpacing: 0.01,
                          wordSpacing: 0.1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  )
                ],
              ),
            ]),
          ],
        ),
      ]),
    );
  }
}
