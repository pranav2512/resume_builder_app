import 'package:flutter/material.dart';

import '../util/util.dart';

class CareerObjective extends StatefulWidget {
  const CareerObjective({super.key});

  @override
  State<CareerObjective> createState() => _CareerObjectiveState();
}

class _CareerObjectiveState extends State<CareerObjective> {

  GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  TextEditingController careerObjectiveController=TextEditingController();
  TextEditingController currentDesignationController=TextEditingController();

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
            "Career Objective",
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
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          height: 300,
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
                                "Career Objective",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter career objective first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.careerObjective = newValue;
                                },
                                controller: careerObjectiveController,
                                maxLines: 8,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Description",
                                    border: OutlineInputBorder()),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          height: 200,
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
                                "Current Designation(Experienced Candidate)",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                onSaved: (newValue) {
                                  Global.currentDesignation = newValue;
                                },
                                controller: currentDesignationController,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Software Engineer",
                                    border: OutlineInputBorder()),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
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
                                  careerObjectiveController.clear();
                                  currentDesignationController.clear();

                                  setState(() {
                                    Global.careerObjective = null;
                                    Global.currentDesignation = null;
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
                                    Navigator.of(context).pushNamed("personaldetails");
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
