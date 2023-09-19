import 'package:flutter/material.dart';
import 'package:newsapp/firebase/firebase_provider.dart';

import 'Widgets/curved_bottom_container.dart';
import 'Widgets/phone_number_felid.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneCtl = TextEditingController();
  bool isLoading = false;
  final loginPageKey = GlobalKey<FormState>();
  FocusScopeNode? currentFocus;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginPageKey,
      child: Scaffold(
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/image/img_2.png"),
              fit: BoxFit.cover,
            )),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
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
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/image/img_2.png"),
                        fit: BoxFit.cover,
                      )),
                      width: 750,
                      height: 290,
                      child: Row(
                        children: [
                          Container(
                            height: 350,
                            width: 340,
                            child: Column(
                              children: [
                                SizedBox(height: 29),
                                const SizedBox(
                                  height: 39,
                                  child: Text(
                                    ' LOGIN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 29),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                  child: Text(
                                    ' We will send you ONE TIME PASSWORD',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 10),
                                  ),
                                ),
                                const SizedBox(
                                  height: 29,
                                  child: Text(
                                    ' on your phone number',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 9),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 36, top: 10, right: 24),
                                  child: PhoneNumberField(
                                      controller: phoneCtl,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "field empty";
                                        } else if (val.length != 10) {
                                          return "please enter a valid phone number";
                                        }
                                        return null;
                                      },
                                      icon: Icons.phone_android_sharp,
                                      keyboardType: TextInputType.phone,
                                      label: "Phone Number"),
                                ),
                                SizedBox(height: 25),
                                SizedBox(
                                  height: 50,
                                  width: 280,
                                  child: isLoading
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            shape: ContinuousRectangleBorder(
                                              side: BorderSide.none,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(30),
                                              ),
                                            ),
                                          ),
                                          onPressed: () async {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();

                                            if (loginPageKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              await FirebaseProvider()
                                                  .login(
                                                      mobileNumber:
                                                          phoneCtl.text,
                                                      context: context)
                                                  .catchError((e) {
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              });
                                              // setState(() {
                                              //   isLoading = false;
                                              // });
                                            }

                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) => OtpPage(),
                                            //       //FristPage(),
                                            //     ));
                                          },
                                          child: Text('GET OTP',
                                              style: TextStyle(
                                                  color: Colors.white)),
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
              ],
            ),
          ),
          CurvedBottomContainer(),
        ]),
      ),
    );
  }
}
