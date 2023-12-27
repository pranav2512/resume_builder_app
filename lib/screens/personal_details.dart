import 'package:flutter/material.dart';

import '../util/util.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController dobController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();

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
            "Personal Details",
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
                                "DOB",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: dobController,
                                validator: (value) {
                                  if(value!.isEmpty)
                                  {
                                    return "Enter your Date of Birth first";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.dob=newValue;
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "DD/MM/YYYY",
                                    border: OutlineInputBorder()),
                              ),
                              Text(
                                "Marital Status",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              RadioListTile(
                                title: Text('Single'),
                                value: "Single",
                                activeColor: Colors.redAccent,
                                groupValue: Global.maritalStatus,
                                onChanged: (val) {
                                  setState(() {
                                    Global.maritalStatus = val!;
                                  });
                                },
                              ),
                              RadioListTile(
                                title: Text('Married'),
                                value: "Married",
                                activeColor: Colors.redAccent,
                                groupValue: Global.maritalStatus,
                                onChanged: (val) {
                                  setState(() {
                                    Global.maritalStatus = val!;
                                  });
                                },
                              ),
                              Text(
                                "Languages Known",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              ...Global.languages.map((e) {
                                return CheckboxListTile(
                                  activeColor: Colors.redAccent,
                                  controlAffinity: ListTileControlAffinity.leading,
                                  title: Text("${e["language"]}"),
                                  value: e["isSelect"],
                                  onChanged: (value) {
                                    setState(() {
                                      e["isSelect"]=value;
                                    });
                                  },
                                );
                              }),
                              Text(
                                "Nationality",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: nationalityController,
                                validator: (value) {
                                  if(value!.isEmpty)
                                    {
                                      return "Enter your nationality first";
                                    }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  Global.nationality=newValue;
                                },
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Indian",
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  globalKey.currentState!.reset();
                                  dobController.clear();
                                  nationalityController.clear();

                                  setState(() {
                                    Global.dob = null;
                                    Global.nationality = null;
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
                                    Navigator.of(context).pushNamed('education');
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
