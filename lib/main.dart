import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mymood/home.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sizer(
        builder: (context, orientation, deviceType) {
          return HomePage();
        },
      ),
    ),
  );
}
