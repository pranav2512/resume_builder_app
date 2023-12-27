import 'package:flutter/material.dart';

import '../util/util.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController dateJoinedController = TextEditingController();
  TextEditingController dateExitController = TextEditingController();

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
            "Experience",
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
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
                                "Company Name",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: companyNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter the Company Name first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.companyName = newValue;
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Infosys",
                                    border: OutlineInputBorder()),
                              ),
                              Text(
                                "Position",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: positionController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter your Position first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.position = newValue;
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Quality test Engineer",
                                    border: OutlineInputBorder()),
                              ),
                              Text(
                                "Role Description(Optional)",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: roleController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter your role first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.roleDescription = newValue;
                                },
                                maxLines: 4,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText:
                                        "Product analysis and quality testing",
                                    border: OutlineInputBorder()),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text('Previously Employeed'),
                                      value: "previous",
                                      activeColor: Colors.redAccent,
                                      groupValue: Global.employmentStatus,
                                      onChanged: (val) {
                                        setState(() {
                                          Global.employmentStatus = val!;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile(
                                      title: Text('Currently Employeed'),
                                      value: "current",
                                      activeColor: Colors.redAccent,
                                      groupValue: Global.employmentStatus,
                                      onChanged: (val) {
                                        setState(() {
                                          Global.employmentStatus = val!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Container(height: 2, color: Colors.black54),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Date Joined",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          controller: dateJoinedController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter the joining Date first";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            Global.dateJoined = newValue;
                                          },
                                          decoration: InputDecoration(
                                              hintStyle:
                                                  TextStyle(fontSize: 20),
                                              hintText: "DD/MM/YYYY",
                                              border: OutlineInputBorder()),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  (Global.employmentStatus == "previous")
                                      ? Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Date Exit",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.redAccent,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 10),
                                              TextFormField(
                                                onSaved: (newValue) {
                                                  Global.dateExit = newValue;
                                                },
                                                decoration: InputDecoration(
                                                    hintStyle:
                                                        TextStyle(fontSize: 20),
                                                    hintText: "DD/MM/YYYY",
                                                    border:
                                                        OutlineInputBorder()),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Expanded(child: Container()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(10),
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  globalKey.currentState!.reset();
                                  companyNameController.clear();
                                  positionController.clear();
                                  roleController.clear();
                                  dateJoinedController.clear();
                                  dateExitController.clear();
                                  setState(() {
                                    Global.companyName = null;
                                    Global.position = null;
                                    Global.roleDescription = null;
                                    Global.dateJoined = null;
                                    Global.dateExit = null;
                                  });
                                },
                                child: const Text(
                                  "Clear",
                                  style: TextStyle(color: Colors.redAccent),
                                ),
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
                                    Navigator.of(context)
                                        .pushNamed('technicalskills');
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.redAccent)),
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
