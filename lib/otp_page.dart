import 'package:flutter/material.dart';
import 'package:newsapp/firebase/firebase_provider.dart';

import 'Widgets/curved_bottom_container.dart';
import 'Widgets/otp_input_feild.dart';

class OtpPage extends StatefulWidget {
  final String verificationId;
  final String mobilNumber;
  const OtpPage(
      {super.key, required this.verificationId, required this.mobilNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final otpController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
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
                                  ' Verfication',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 29),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                                child: Text(
                                  'YOU will get OTP via SMS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 10),
                                ),
                              ),
                              const SizedBox(
                                height: 29,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 36, top: 10, right: 24),
                                child: OtpInputFeild(
                                    icon: Icons.password_outlined,
                                    keyboardType: TextInputType.phone,
                                    controller: otpController,
                                    label: "ENTER OTP"),
                              ),
                              SizedBox(height: 25),
                              SizedBox(
                                height: 50,
                                width: 280,
                                child: isLoading
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
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
                                          setState(() {
                                            isLoading = true;
                                          });
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          await FirebaseProvider()
                                              .verfiction(
                                                  verificationId:
                                                      widget.verificationId,
                                                  smsCode: otpController.text,
                                                  context: context)
                                              .then((value) {
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }).catchError((e) {
                                            setState(() {
                                              isLoading = false;
                                            });
                                          });
                                        },
                                        child: Text('VERIFY',
                                            style:
                                                TextStyle(color: Colors.white)),
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
    );
  }
}
