import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:simple_animations/simple_animations.dart';
import '../Animations/FadeAnimation.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeAnimation(
        1,
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Appentercity.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 25.0,
                    ),
                  ),
                ),
                FadeAnimation(
                  1.2,
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: kTextFieldInputDecoration,
                      onChanged: (value) {
                        cityName = value;
                      },
                    ),
                  ),
                ),
                /*FadeAnimation(1.4, FlatButton(
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                    child: Text(
                      'Get Weather',
                      style: kButtonTextStyle,
                    ),
                  ),
                ),*/
                FadeAnimation(1.4, Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),
                    child: GestureDetector(
                      child: Center(
                        child: Text(
                          "Get Weather",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context, cityName);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
