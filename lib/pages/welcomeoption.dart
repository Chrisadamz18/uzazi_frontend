import 'package:flutter/material.dart';
import '/pages/register.dart';

class welcomeOption extends StatelessWidget {
  const welcomeOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(40),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shadowColor: Color(0xff39065a),
                  child: Image.asset(
                    'assets/images/2.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 10,
                  ),
                  child: Text(
                    'Welcome to Uzazi-Care,the revolutionary healthcare platform that sees to connects young adults to qualified Health Personnels for the treatment of their reproduction health issues.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color(0xff39065a),
                      fontWeight: FontWeight.bold,
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Are you a Health Personnel or a Patient?',
                      style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: Color(0xff39065a),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  right: 30,
                ),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        elevation: 15,
                        borderRadius: BorderRadius.circular(50),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xfff5550e),
                        shadowColor: Color(0xff39065a),
                        child: InkWell(
                          splashColor: Color(0xff39065a),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Ink.image(
                                    image: AssetImage('assets/images/2.png'),
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Health Personnel',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  right: 110,
                ),
                child: SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      elevation: 15,
                      borderRadius: BorderRadius.circular(50),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xfff5550e),
                      shadowColor: Color(0xff39065a),
                      child: InkWell(
                        splashColor: Color(0xff39065a),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Ink.image(
                                  image: AssetImage('assets/images/2.png'),
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  // child: Text('Patient'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Patient',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
