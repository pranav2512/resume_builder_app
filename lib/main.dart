import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder/screens/achievements.dart';
import 'package:resume_builder/screens/career_objective.dart';
import 'package:resume_builder/screens/cat_page.dart';
import 'package:resume_builder/screens/contact_info.dart';
import 'package:resume_builder/screens/declaration.dart';
import 'package:resume_builder/screens/education.dart';
import 'package:resume_builder/screens/experience.dart';
import 'package:resume_builder/screens/hobbies.dart';
import 'package:resume_builder/screens/home_page.dart';
import 'package:resume_builder/screens/personal_details.dart';
import 'package:resume_builder/screens/projects.dart';
import 'package:resume_builder/screens/references.dart';
import 'package:resume_builder/screens/show_preview.dart';
import 'package:resume_builder/screens/splash_screen.dart';
import 'package:resume_builder/screens/technical_skills.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.redAccent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      initialRoute: "splash",
      routes: {
        "/": (context) => HomePage(),
        "catpage": (context) => CatPage(),
        "splash": (context) => SplashScreen(),
        "contactinfo":(context) => ContactInfo(),
        "careerobjective":(context) => CareerObjective(),
        "personaldetails":(context) => PersonalDetails(),
        "education":(context) => Education(),
        "experience":(context) => Experience(),
        "projects":(context) => Projects(),
        "references":(context) => References(),
        "showdetail":(context) => ShowDetails(),
        "achievements":(context) => Achievements(),
        "technicalskills":(context) => TechnicalSkills(),
        "declaration":(context) => Declaration(),
        "interesthobbies":(context) => Hobbies(),
      },
    );
  }
}


