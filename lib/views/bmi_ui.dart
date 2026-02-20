// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  //สร้างตัวควบคุม textfied
  TextEditingController weighCtrl = TextEditingController();
  TextEditingController heighCtrl = TextEditingController();

  //สร้างตัวแปรเก็บค่า MBI และ การแปลผล
  double bmiValue = 0;
  String bmiResult = 'การแปลผล';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50.0, // ห่างบนล่าง
            horizontal: 40.0, // ห่างซ้ายขวา
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 140.0,
                  height: 140.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30.0),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg.)',
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  controller: weighCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'กรุณากรอกน้ำหนัก',
                  ),
                ),
                SizedBox(height: 30.0),
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm.)',
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  controller: heighCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'กรุณากรอกส่วนสูง',
                  ),
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    //Validate input
                    if (weighCtrl.text.isEmpty || heighCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณาป้อนน้ำหนักส่วนสูงให้ครบ'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );

                      return;
                    }

                    //คำนวณ BMI
                    double w = double.parse(weighCtrl.text);
                    double h = double.parse(heighCtrl.text);
                    double bmi = w / ((h / 100) * (h / 100));
                    setState(() {
                      bmiValue = bmi;
                    });

                    //แปลผล
                    setState(() {
                      if (bmi < 18.5) {
                        bmiResult = 'ผอมไป';
                      } else if (bmi < 22.9) {
                        bmiResult = 'หุ่นปกติ';
                      } else if (bmi < 24.9) {
                        bmiResult = 'เริ่มอ้วน';
                      } else if (bmi < 29.9) {
                        bmiResult = 'โรคอ้วนระยะที่ 1';
                      } else if (bmi < 39.9) {
                        bmiResult = 'โรคอ้วนระยะที่ 2';
                      } else {
                        bmiResult = 'เตรียมตุย...T_T';
                      }
                    });
                  },
                  child: Text(
                    'คำนวณค่า BMI',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    fixedSize: Size(MediaQuery.of(context).size.width, 55.0),
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      weighCtrl.clear();
                      heighCtrl.clear();
                      bmiValue = 0;
                      bmiResult = 'การแปลผล';
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(MediaQuery.of(context).size.width, 55.0),
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'BMI',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiValue.toStringAsFixed(2),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
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
    );
  }
}
