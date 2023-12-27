import 'package:flutter/material.dart';

import '../util/util.dart';

class Declaration extends StatefulWidget {
  const Declaration({super.key});

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {
  bool switchVal = false;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController declarationDescriptionController = TextEditingController();
  TextEditingController declarationDateController = TextEditingController();
  TextEditingController declarationPlaceController = TextEditingController();
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
            "Declaration",
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
                  child: SizedBox(
                    height: 550,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Declaration",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                value: switchVal,
                                activeColor: Colors.redAccent,
                                thumbColor:
                                    MaterialStatePropertyAll(Colors.redAccent),
                                onChanged: (value) {
                                  switchVal = value;
                                  setState(() {});
                                },
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: (switchVal)
                              ? Form(
                                key: globalKey,
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(10),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset("images/target.png",height: 60,width: 60,),
                                        ),
                                        TextFormField(
                                          controller: declarationDescriptionController,
                                          validator: (value) {
                                            if(value!.isEmpty)
                                            {
                                              return "Enter your declaration first";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            Global.declarationDescription=newValue;
                                          },
                                          decoration: InputDecoration(
                                              hintStyle: TextStyle(fontSize: 20),
                                              hintText:
                                                  "Description",
                                              border: OutlineInputBorder()),
                                        ),
                                        Container(height: 2, color: Colors.black54),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Date",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.redAccent,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 10),
                                                  TextFormField(
                                                    controller: declarationDateController,
                                                    validator: (value) {
                                                      if(value!.isEmpty)
                                                      {
                                                        return "Enter your declaration date first";
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (newValue) {
                                                      Global.declarationDate=newValue;
                                                    },
                                                    decoration: InputDecoration(
                                                        hintStyle: TextStyle(fontSize: 20),
                                                        hintText:
                                                        "DD/MM/YYYY",
                                                        border: OutlineInputBorder()),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 30),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Place(Interview venue/city)",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.redAccent,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 10),
                                                  TextFormField(
                                                    controller: declarationPlaceController,
                                                    validator: (value) {
                                                      if(value!.isEmpty)
                                                      {
                                                        return "Enter your declaration place";
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (newValue) {
                                                      Global.declarationPlace=newValue;
                                                    },
                                                    decoration: InputDecoration(
                                                        hintStyle: TextStyle(fontSize: 20),
                                                        hintText:
                                                        "eg. Surat",
                                                        border: OutlineInputBorder()),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            OutlinedButton(
                                              onPressed: () {
                                                globalKey.currentState!.reset();
                                                declarationDescriptionController.clear();
                                                declarationDateController.clear();
                                                declarationPlaceController.clear();
                                                setState(() {
                                                  Global.declarationDescription = null;
                                                  Global.declarationDate = null;
                                                  Global.declarationPlace = null;
                                                });
                                              },
                                              child: const Text(
                                                "Clear",
                                                style: TextStyle(
                                                    color: Colors.redAccent),
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
                                                  Navigator.of(context).pushNamed('showdetail');
                                                }
                                              },
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.redAccent)),
                                              child: const Text("Save"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                              )
                              : Container(),
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
