import 'package:flutter/material.dart';
import 'package:resume_builder/util/util.dart';

class TechnicalSkills extends StatefulWidget {
  const TechnicalSkills({super.key});

  @override
  State<TechnicalSkills> createState() => _TechnicalSkillsState();
}

class _TechnicalSkillsState extends State<TechnicalSkills> {

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

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
            "Technical Skills",
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Enter Your Skills",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              ...Global.technicalSkills.map((e) {
                                return Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        controller: e,
                                        validator: (value) {
                                          if(value!.isEmpty)
                                          {
                                            return "Enter a skill first";
                                          }
                                          return null;
                                        },
                                        onSaved: (newValue) {
                                          e.text=newValue!;
                                        },
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 20),
                                          hintText: "Enter a skill",
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: IconButton(
                                          onPressed: () {
                                            Global.technicalSkills.remove(e);
                                            setState(() {
                                            });
                                          },
                                          icon: Icon(Icons.delete)),
                                    ),
                                  ],
                                );
                              }),
                              SizedBox(height: 30),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Global.technicalSkills.add(TextEditingController());
                                      setState(() {
                                      });
                                    },
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(
                                            Colors.redAccent)),
                                    child: Icon(Icons.add)),
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
                                    Navigator.of(context).pushNamed('interesthobbies');
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
