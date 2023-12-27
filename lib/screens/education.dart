import 'package:flutter/material.dart';

import '../util/util.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {

  GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  TextEditingController degreeController=TextEditingController();
  TextEditingController collegeController=TextEditingController();
  TextEditingController gradeController=TextEditingController();
  TextEditingController yearOfPassingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Education",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new, color: Colors.white)),
        ),
        body: Column(
          children: [
            Container(
              height: 80,
              color: Colors.redAccent,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.black12,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Form(
                    key: globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          height: 500,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Course/Degree",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: degreeController,
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return "Enter your Course/Degree first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.degree=newValue;
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "B.Tech Information Technology",
                                    border: OutlineInputBorder()),
                              ),
                              Text(
                                "School/College/Institute",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: collegeController,
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return "Enter your School/College/Institute first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.college=newValue;
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Red and White",
                                    border: OutlineInputBorder()),
                              ),
                              Text(
                                "Grade",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: gradeController,
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return "Enter your Grade first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.grade=newValue;
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "80% or 8.0 CGPA",
                                    border: OutlineInputBorder()),
                              ),
                              Text(
                                "Year of passing",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: yearOfPassingController,
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return "Enter your Year of Passing first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.yearOfPassing=newValue;
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "2019",
                                    border: OutlineInputBorder()),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  globalKey.currentState!.reset();
                                  degreeController.clear();
                                  collegeController.clear();
                                  gradeController.clear();
                                  yearOfPassingController.clear();
                                  setState(() {
                                    Global.degree = null;
                                    Global.college = null;
                                    Global.grade = null;
                                    Global.yearOfPassing = null;
                                  });
                                },
                                child: const Text("Clear",style: TextStyle(color: Colors.redAccent),),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (globalKey.currentState!.validate()) {
                                    globalKey.currentState!.save();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        content: Text('Details Saved'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    Navigator.of(context).pushNamed('experience');
                                  }
                                },
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
                                child: const Text("Next"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
