import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class InputCode extends StatefulWidget {
  const InputCode({super.key});

  @override
  State<InputCode> createState() {
    return _InputCode();
  }
}

class _InputCode extends State<InputCode> {
  final numberController = TextEditingController();
  final numberController2 = TextEditingController();
  final numberController3 = TextEditingController();
  final numberController4 = TextEditingController();
  String errorMessage = "";

  @override
  void dispose() {
    // print("Dispose ishladi: ${widget.index}");
    numberController.dispose();
    numberController2.dispose();
    numberController3.dispose();
    numberController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          leadingWidth: 75,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/third");
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            ),
          )),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Confirm your phone number",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Check your message, because we send you a code for Verification",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 10),
                OtpTextField(
                  fieldWidth: 70,
                  fieldHeight: 100,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.1),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outlined, size: 25, color: Colors.grey),
                    Text(
                      " Helper text",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      String code = numberController.text.trim();
                      String code2 = numberController.text.trim();
                      String code3 = numberController.text.trim();
                      String code4 = numberController.text.trim();

                      if (code.isEmpty ||
                          code2.isEmpty ||
                          code3.isEmpty ||
                          code4.isEmpty) {
                        errorMessage = "Iltimos kerakli bo'limni to'ldiring";
                        setState(() {});
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: AlertDialog(
                                title: const Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.blue,
                                  size: 150,
                                ),
                                content: SizedBox(
                                  height: 190,
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Your account has active',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        'Congurulation you are succes to change your profile',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, "/home");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          backgroundColor: Colors.blue,
                                          foregroundColor: Colors.white,
                                          textStyle: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 140, right: 140),
                                          child: Text("Ok"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text("Continue"),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "By continuing you agree to Loana's",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Terms of Use ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    Text(
                      "&",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    Text(
                      " Privacy Policy",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
