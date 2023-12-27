import 'package:flutter/material.dart';

import '../util/util.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController projectTitleController = TextEditingController();
  TextEditingController projectRoleController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();

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
            "Projects",
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
                          height: 560,
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
                                "Project Title",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: projectTitleController,
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return "Enter your Project Title first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.projectTitle=newValue;
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Resume Builder",
                                    border: OutlineInputBorder()),
                              ),
                              Text(
                                "Technologies",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              ...Global.projectTechnologies.map((e) {
                                return CheckboxListTile(
                                  activeColor: Colors.redAccent,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: Text("${e["technology"]}"),
                                  value: e["isSelect"],
                                  onChanged: (value) {
                                    setState(() {
                                      e["isSelect"] = value;
                                    });
                                  },
                                );
                              }),
                              Text(
                                "Roles",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: projectRoleController,
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return "Enter your Project Roles first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.projectRoles=newValue;
                                },
                                maxLines: 2,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText:
                                        "Product analysis and quality testing",
                                    border: OutlineInputBorder()),
                              ),
                              Text(
                                "Project Description",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: projectDescriptionController,
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return "Enter your Project Description first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.projectDescription=newValue;
                                },
                                maxLines: 3,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Project description",
                                    border: OutlineInputBorder()),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(vertical: 10),
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
                                  projectTitleController.clear();
                                  projectRoleController.clear();
                                  projectDescriptionController.clear();
                                  setState(() {
                                    Global.projectTitle = null;
                                    Global.projectRoles = null;
                                    Global.projectDescription = null;
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
                                    Navigator.of(context).pushNamed('achievements');
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
