import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder/util/util.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  bool selected = true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController address1Controller=TextEditingController();
  TextEditingController address2Controller=TextEditingController();
  TextEditingController address3Controller=TextEditingController();

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
            "Resume Workspace",
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
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 15,
                          child: InkWell(
                            onTap: () {
                              selected = true;
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.bottomCenter,
                              width: double.infinity,
                              color: Colors.redAccent,
                              child: Text(
                                "Contact",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: (selected) ? Colors.black54 : Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 15,
                          child: InkWell(
                            onTap: () {
                              selected = false;
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.bottomCenter,
                              width: double.infinity,
                              color: Colors.redAccent,
                              child: Text(
                                "Photo",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            color:
                                (!selected) ? Colors.black54 : Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Form(
                key: globalKey,
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.black12,
                  alignment: Alignment.topCenter,
                  child: (selected)
                      ? SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 500,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Icon(Icons.person,
                                            size: 40, color: Colors.black54)),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        controller: nameController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter your name first";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            Global.name = newValue;
                                          },
                                          decoration: InputDecoration(
                                              hintText: "Enter Your Name")),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Icon(Icons.email,
                                            size: 40, color: Colors.black54)),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        controller: emailController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter your email first";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            Global.email = newValue;
                                          },
                                          decoration:
                                              InputDecoration(hintText: "Email")),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Icon(Icons.phone_android_sharp,
                                            size: 40, color: Colors.black54)),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        controller: phoneController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter your phone number first";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            Global.phone = newValue;
                                          },
                                          decoration:
                                              InputDecoration(hintText: "Phone")),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Icon(Icons.location_on_rounded,
                                            size: 40, color: Colors.black54)),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        controller: address1Controller,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter your Address first";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            Global.address1 = newValue;
                                          },
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Address(Street,Building No)")),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(flex: 1, child: SizedBox()),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        controller: address2Controller,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter your Address line 2  first";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            Global.address2 = newValue;
                                          },
                                          decoration: InputDecoration(
                                              hintText: "Address Line 2")),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(flex: 1, child: SizedBox()),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        controller: address3Controller,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter your Address Line 3 first";
                                            }
                                            return null;
                                          },
                                          onSaved: (newValue) {
                                            Global.address3 = newValue;
                                          },
                                          decoration: InputDecoration(
                                              hintText: "Address Line 3")),
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
                                        nameController.clear();
                                        emailController.clear();
                                        phoneController.clear();
                                        address1Controller.clear();
                                        address2Controller.clear();
                                        address3Controller.clear();
                                        setState(() {
                                          Global.name = null;
                                          Global.phone = null;
                                          Global.email = null;
                                          Global.address1 = null;
                                          Global.address2 = null;
                                          Global.address3 = null;
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
                                          Navigator.pushNamed(
                                              context, "careerobjective");
                                        }
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.redAccent)),
                                      child: const Text("Next"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              (Global.profileImage!=null)?
                              CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.grey,
                                backgroundImage: FileImage(Global.profileImage!),
                              ):CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.grey,
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 20),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.redAccent,
                                    onPressed: ()async{
                                      ImagePicker picker=ImagePicker();
                                      XFile? xFile= await picker.pickImage(source: ImageSource.camera);
                                      String? path=xFile!.path;
                                      setState(() {
                                        Global.profileImage=File(path);
                                      });
                                    },
                                    child: Icon(Icons.camera),
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: Colors.redAccent,
                                    onPressed: () async{
                                      ImagePicker picker=ImagePicker();
                                      XFile? xFile= await picker.pickImage(source: ImageSource.gallery);
                                      String? path=xFile!.path;
                                      setState(() {
                                        Global.profileImage=File(path);
                                      });
                                    },
                                    child: Icon(Icons.photo),
                                  ),
                                ],
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
