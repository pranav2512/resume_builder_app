import 'package:flutter/material.dart';

import '../util/util.dart';

class References extends StatefulWidget {
  const References({super.key});

  @override
  State<References> createState() => _ReferencesState();
}

class _ReferencesState extends State<References> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController referenceNameController = TextEditingController();
  TextEditingController referenceDesignationController = TextEditingController();
  TextEditingController referenceInstituteController = TextEditingController();
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
            "References",
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
                                "Reference Name",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: referenceNameController,
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return "Enter your Reference Name first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.referenceName=newValue;
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Pranav Harnesha",
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Designation",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: referenceDesignationController,
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return "Enter your Reference Designation first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.referenceDesignation=newValue;
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "CEO",
                                    border: OutlineInputBorder()),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Organization/Institute",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: referenceInstituteController,
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return "Enter your Reference Organization first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.referenceInstitute=newValue;
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Green Energy Ltd.",
                                    border: OutlineInputBorder()),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
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
                                  referenceNameController.clear();
                                  referenceDesignationController.clear();
                                  referenceInstituteController.clear();
                                  setState(() {
                                    Global.referenceName = null;
                                    Global.referenceDesignation = null;
                                    Global.referenceInstitute = null;
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
                                    Navigator.of(context).pushNamed('declaration');
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
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
