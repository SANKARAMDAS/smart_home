import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //padding_constant
  final double horizontalPadding = 40.0;

  final double verticalPadding = 25.0;

  //list of smart devices
  List mySmartDevices = [
    //[ smartDevices, iconPath, powerStatus]
    ['Smart Light', 'lib/icons/light-bulb.png', true],
    ['Smart AC', 'lib/icons/air-conditioner.png', true],
    ['Smart TV', 'lib/icons/smart-tv.png', true],
    ['Smart Fan', 'lib/icons/fan.png', true],
  ];

  //smart button switch
  void powerSwicthChange(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom_app_bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu_icon
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45.0,
                    color: Colors.grey[800],
                  ),
                  //account_icon
                  Icon(
                    Icons.person,
                    size: 45.0,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 10.0,
            ),

            //welcome_banner
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Home,', style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),),
                  Text(
                    'San.D',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 72.0
                    ),
                  ),
                ],
              ),
            ),

            //smart_devices + grid
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Text('Smart Devices'),
            ),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(25.0),
                itemCount: mySmartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                childAspectRatio: 1 /1.2),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwicthChange(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
