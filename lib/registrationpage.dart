import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workforce/login_page.dart';
import 'package:velocity_x/velocity_x.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController firstname1 = TextEditingController();
  TextEditingController lastname1 = TextEditingController();
  TextEditingController email1 = TextEditingController();
  TextEditingController password1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/backgroundUI.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: SvgPicture.asset("images/xing.svg")),
                      const HeightBox(10),
                      "Registration".text.color(Colors.white).size(20).make(),
                      const HeightBox(20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextField(
                          controller: firstname1,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            isDense: true, // Added this
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          ),
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const HeightBox(20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextField(
                          controller: lastname1,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            isDense: true, // Added this
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          ),
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const HeightBox(20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextField(
                          controller: email1,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            isDense: true, // Added this
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          ),
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const HeightBox(20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextField(
                          controller: password1,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            isDense: true, // Added this
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          ),
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const HeightBox(20),
                      InkWell(
                          onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setString('firstname', firstname1.text);
                            await prefs.setString('lastname', lastname1.text);
                            await prefs.setString('email', email1.text);
                            await prefs.setString('password', password1.text);
                            if (!mounted) return;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: "Sign-Up"
                              .text
                              .white
                              .light
                              .xl
                              .makeCentered()
                              .box
                              .white
                              .shadowOutline(outlineColor: Colors.grey)
                              .color(const Color(0XFFFF0772))
                              .roundedLg
                              .make()
                              .w(150)
                              .h(40)),
                      const HeightBox(140),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: RichText(
              text: const TextSpan(
            text: 'New User?',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Login Now',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF4321F5)),
              ),
            ],
          )).pLTRB(20, 0, 0, 15),
        ));
  }
}
