import 'package:flutter/material.dart';
import 'package:mymood/widget/activityWidget.dart';
import 'package:mymood/widget/diaryWidget.dart';
import 'package:mymood/widget/testWidget.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pilihHal = 0;

  List<Widget> halaman = [
    activityWidget(),
    diaryWidget(),
    testWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        shadowColor: Colors.transparent,
        title: Text(
          'myMood',
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: halaman[pilihHal],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            pilihHal = value;
          });
        },
        currentIndex: pilihHal,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.accessibility), label: 'Activities'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Thought Diary'),
          BottomNavigationBarItem(icon: Icon(Icons.my_library_books), label: 'Test'),
        ],
      ),
    );
  }
}
