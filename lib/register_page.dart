import 'package:flutter/material.dart';
import 'package:newsapp/ts.dart';

import 'Widgets/curved_bottom_container.dart';
import 'Widgets/custom_search_field.dart';
import 'Widgets/phone_number_felid.dart';
import 'home_login_page.dart';

class RegisterPaage extends StatefulWidget {
  const RegisterPaage({super.key});

  @override
  State<RegisterPaage> createState() => _RegisterPaageState();
}

class _RegisterPaageState extends State<RegisterPaage> {
  final phoneCtl = TextEditingController();
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
                  width: 950,
                  height: 360,
                  child: Row(
                    children: [
                      Container(
                        height: 350,
                        width: 340,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 12, top: 10, right: 10),
                              child: PhoneNumberField(
                                controller: phoneCtl,
                                icon: Icons.person,
                                label: "name",
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "field empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 12, top: 10, right: 10),
                                child: PhoneNumberField(
                                    controller: phoneCtl,
                                    icon: Icons.phone_android_sharp,
                                    keyboardType: TextInputType.phone,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "field empty";
                                      }
                                      return null;
                                    },
                                    label: "Phone Number")),
                            const Padding(
                                padding: EdgeInsets.only(
                                    left: 12, top: 10, right: 10),
                                child: CustomSearchField(
                                    icon: Icons.password_outlined,
                                    label: "Password")),
                            const Padding(
                                padding: EdgeInsets.only(
                                    left: 12, top: 10, right: 10),
                                child: CustomSearchField(
                                    icon: Icons.password_outlined,
                                    label: "Re Enter Password")),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 10, top: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(300, 30),
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
                                  'SingUp',
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
                  const Text("I have an account?",
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
                              builder: (context) => HomeLoginPage(),
                            ));
                      },
                      child: const Text(
                        "Login",
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
