import 'package:flutter/material.dart';
import 'package:flutter_sau_health_calcurator_app/views/about_ui.dart';
import 'package:flutter_sau_health_calcurator_app/views/bmi_ui.dart';
import 'package:flutter_sau_health_calcurator_app/views/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  //ตัวแปรเก็บ Index ที่เลือก
  int selectIndexItem = 1;

  //ตัวแปรเก็บหน้าจอย่อยที่จะเอามาแสดงที่ body
  List showInBody = [
    BmiUi(), // 0
    AboutUi(), // 1
    BmrUi(), // 2
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Body Health Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: showInBody[selectIndexItem],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (paramValue) {
          setState(() {
            selectIndexItem = paramValue;
          });
        },
        currentIndex: selectIndexItem,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.deepOrange[100],
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.heartCircleBolt,
            ),
            label: 'BMR',
          ),
        ],
      ),
    );
  }
}
