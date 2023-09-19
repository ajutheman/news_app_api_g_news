import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/otp_page.dart';

import '../home_page.dart';

class FirebaseProvider {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future login(
      {required String mobileNumber, required BuildContext context}) async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91$mobileNumber",
      verificationCompleted: (PhoneAuthCredential credential) {
        print(credential.smsCode);
      },
      verificationFailed: (error) {},
      codeSent: (verificationId, forceResendingToken) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OtpPage(
                  mobilNumber: mobileNumber, verificationId: verificationId),
            ));
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  Future verfiction(
      {required String verificationId,
      required String smsCode,
      required BuildContext context}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      print("userCredential.credential?.accessToken");
      print(userCredential.credential?.accessToken);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
          (route) => false);
    } catch (e) {
      debugPrint("wrong otp");
      debugPrint(e.toString());
    }
  }
}
