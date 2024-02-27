// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rorich/side_menu.dart';

class ConvertMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0000EB),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 1.0, top: 10.0, bottom: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(left: 1.0),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Icon(Icons.menu, color: Colors.black),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        drawer: NavDrawer(),
        backgroundColor: Color(0xFF0000EB),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'EUR',
                  style: TextStyle(
                    color: Color(0xFFFEC4DD),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 254,
                  height: 99,
                  child: Text(
                    '120.00',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFEC4DD),
                      fontSize: 64,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 6.40,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  '1 USD  = 0.90 EUR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFEC4DD),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 100, // Set the desired width for the button
                  child: ElevatedButton(
                    onPressed: () {
                      print('click me');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(
                          0xFFFEC4DD)), // Set the background color for the button
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30), // Optional: Add border radius
                        ),
                      ),
                    ),
                    child: Icon(Icons.currency_exchange_rounded),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFEC4DD),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 254,
                  height: 99,
                  child: Text(
                    '0.00',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFEC4DD),
                      fontSize: 64,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 6.40,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '1 EUR  = 1.11 USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFEC4DD),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 234,
                  height: 60, // Set the desired width for the button
                  child: ElevatedButton(
                    onPressed: () {
                      print('click me');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(
                          0xFFD7EC54)), // Set the background color for the button
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Optional: Add border radius
                        ),
                      ),
                    ),
                    child: Text(
                      'Convert',
                      style: TextStyle(
                        color: Color(0xFF54474D),
                        fontSize: 32,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  // Navigate to the desired page when the icon is tapped
                  Navigator.pushNamed(context, '/currency_center');
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Currency Center',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      Icon(Icons.arrow_circle_right, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
