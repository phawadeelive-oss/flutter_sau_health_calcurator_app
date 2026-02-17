// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_sau_health_calcurator_app/views/home_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // โค้ดหน่วงเวลาหน้าจอ HomeUi แบบย้อยกลับไม่ได้
    Future.delayed(
        //หน่วงเวลา 3 วิ
        Duration(seconds: 3),
        //พอครบเวลาให้เปิดไปหน้าจอ HomeUi แบบย้อนกลับไม่ได้
        () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUi(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30.0),
            Text(
              'Body health Calculator',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30.0),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
