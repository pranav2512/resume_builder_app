import 'dart:io';

import 'package:flutter/cupertino.dart';

List<Map> catList = [
  {
    "name": "Contact Info",
    "image": "images/contact-books.png",
    "screen": "contactinfo"
  },
  {
    "name": "Career Objective",
    "image": "images/briefcase.png",
    "screen": "careerobjective"
  },
  {
    "name": "Personal Details",
    "image": "images/user.png",
    "screen": "personaldetails"
  },
  {
    "name": "Education",
    "image": "images/mortarboard.png",
    "screen": "education"
  },
  {
    "name": "Experience",
    "image": "images/thinking.png",
    "screen": "experience"
  },
  {
    "name": "Technical Skills",
    "image": "images/experience.png",
    "screen": "technicalskills"
  },
  {
    "name": "Interest/Hobbies",
    "image": "images/open-book.png",
    "screen": "interesthobbies"
  },
  {"name": "Projects", "image": "images/project.png", "screen": "projects"},
  {
    "name": "Achievements",
    "image": "images/achievement.png",
    "screen": "achievements"
  },
  {
    "name": "References",
    "image": "images/handshake.png",
    "screen": "references"
  },
  {
    "name": "Declaration",
    "image": "images/declaration.png",
    "screen": "declaration"
  }
];

class Global {
  static String? name;
  static String? phone;
  static String? email;
  static String? address1;
  static String? address2;
  static String? address3;

  static File? profileImage;

  static String? careerObjective;
  static String? currentDesignation;

  static String? dob;
  static String? nationality;
  static String? maritalStatus = "Single";
  static List<Map<String, dynamic>> languages = [
    {
      "isSelect": false,
      "language": "English",
    },
    {
      "isSelect": false,
      "language": "Hindi",
    },
    {
      "isSelect": false,
      "language": "Gujarati",
    },
  ];

  static String? degree;
  static String? college;
  static String? grade;
  static String? yearOfPassing;

  static String? employmentStatus = "previous";
  static String? companyName;
  static String? position;
  static String? roleDescription;
  static String? dateJoined;
  static String? dateExit;

  static List<TextEditingController> technicalSkills = [
    TextEditingController(),
    TextEditingController()
  ];

  static List<TextEditingController> hobbies = [
    TextEditingController(),
    TextEditingController()
  ];

  static String? projectTitle;
  static String? projectRoles;
  static String? projectDescription;
  static List<Map<String, dynamic>> projectTechnologies = [
    {
      "isSelect": false,
      "technology": "Front-end",
    },
    {
      "isSelect": false,
      "technology": "Back-end",
    },
  ];

  static List<TextEditingController> achievements = [
    TextEditingController(),
    TextEditingController()
  ];

  static String? referenceName;
  static String? referenceDesignation;
  static String? referenceInstitute;

  static String? declarationDescription;
  static String? declarationDate;
  static String? declarationPlace;

}
