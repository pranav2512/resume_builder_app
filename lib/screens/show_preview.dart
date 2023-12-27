import 'package:flutter/material.dart';
import 'package:resume_builder/util/util.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ShowDetails extends StatefulWidget {
  const ShowDetails({super.key});

  @override
  State<ShowDetails> createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  final pdf = pw.Document();
  final image = pw.MemoryImage(
    Global.profileImage!.readAsBytesSync(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build:(context) {
          return pw.Row(
            children: [
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  color: PdfColor.fromInt(0xFF323B4C),
                  child: pw.Column(
                    children: [
                      //TODO:ProfileImage
                      pw.Expanded(
                        flex: 5,
                        child: pw.Container(
                          child: (Global.profileImage != null)
                              ? pw.Image(
                            image,
                            fit: pw.BoxFit.cover,
                            // height: 80,
                          )
                              : pw.Container(),
                        ),
                      ),
                      //TODO:Contact
                      pw.Expanded(
                        flex: 5,
                        child: pw.Container(
                          padding: pw.EdgeInsets.only(left: 20, top: 3, bottom: 3),
                          width: double.infinity,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "Contact",
                                style: pw.TextStyle(
                                    fontSize: 18,
                                    color: PdfColors.white,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Container(
                                  color: PdfColors.white,
                                  height: 1,
                                  width: double.infinity),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "Phone",
                                style: pw.TextStyle(fontSize: 12, color: PdfColors.white),
                              ),
                              pw.Text(
                                "${Global.phone}",
                                style: pw.TextStyle(fontSize: 8, color: PdfColors.white),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "Email",
                                style: pw.TextStyle(fontSize: 12, color: PdfColors.white),
                              ),
                              pw.Text(
                                "${Global.email}",
                                style: pw.TextStyle(fontSize: 8, color: PdfColors.white),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "Address",
                                style: pw.TextStyle(fontSize: 12, color: PdfColors.white),
                              ),
                              pw.Text(
                                "${Global.address1}",
                                style: pw.TextStyle(fontSize: 8, color: PdfColors.white),
                              ),
                              pw.Text(
                                "${Global.address2}",
                                style: pw.TextStyle(fontSize: 8, color: PdfColors.white),
                              ),
                              pw.Text(
                                "${Global.address3}",
                                style: pw.TextStyle(fontSize: 8, color: PdfColors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //TODO:Education
                      pw.Expanded(
                        flex: 5,
                        child: pw.Container(
                          padding: pw.EdgeInsets.only(left: 20, top: 3, bottom: 3),
                          width: double.infinity,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "Education",
                                style: pw.TextStyle(
                                    fontSize: 18,
                                    color: PdfColors.white,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Container(
                                  color: PdfColors.white,
                                  height: 1,
                                  width: double.infinity),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.yearOfPassing}",
                                style: pw.TextStyle(fontSize: 12, color: PdfColors.white),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.degree}",
                                style: pw.TextStyle(fontSize: 12, color: PdfColors.white),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.college}",
                                style: pw.TextStyle(fontSize: 12, color: PdfColors.white),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.grade}",
                                style: pw.TextStyle(fontSize: 12, color: PdfColors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //TODO:TechnicalSkills
                      pw.Expanded(
                        flex: 5,
                        child: pw.Container(
                          padding: pw.EdgeInsets.only(left: 20, top: 3, bottom: 3),
                          width: double.infinity,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "Expertise",
                                style: pw.TextStyle(
                                    fontSize: 18,
                                    color: PdfColors.white,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Container(
                                  color: PdfColors.white,
                                  height: 1,
                                  width: double.infinity),
                              pw.SizedBox(height: 5),
                              ...Global.technicalSkills.map((e) {
                                return  pw.Row(
                                  children: [
                                    pw.Container(
                                      width: 7,
                                      height: 7,
                                      decoration: pw.BoxDecoration(
                                          color: PdfColors.white,
                                          shape: pw.BoxShape.circle),
                                    ),
                                    pw.SizedBox(
                                      width: 4,
                                    ),
                                    pw.Text(
                                      "${e.text}",
                                      style: pw.TextStyle(
                                          fontSize: 12, color: PdfColors.white),
                                    ),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      //TODO:References
                      pw.Expanded(
                        flex: 4,
                        child: pw.Container(
                          padding: pw.EdgeInsets.only(left: 20, top: 3, bottom: 3),
                          width: double.infinity,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "References",
                                style: pw.TextStyle(
                                    fontSize: 18,
                                    color: PdfColors.white,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Container(
                                  color: PdfColors.white,
                                  height: 1,
                                  width: double.infinity),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.referenceName}",
                                style: pw.TextStyle(fontSize: 12, color: PdfColors.white),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.referenceDesignation}",
                                style: pw.TextStyle(fontSize: 12, color: PdfColors.white),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.referenceInstitute}",
                                style: pw.TextStyle(fontSize: 12, color: PdfColors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pw.Expanded(
                flex: 2,
                child: pw.Container(
                  child: pw.Column(
                    children: [
                      //TODO:PersonalInfo
                      pw.Expanded(
                        flex: 5,
                        child: pw.Container(
                          padding: pw.EdgeInsets.only(left: 20, top: 3, bottom: 3),
                          width: double.infinity,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(height: 15),
                              pw.Text(
                                "${Global.name}",
                                style: pw.TextStyle(
                                    fontSize: 25,
                                    color: PdfColor.fromInt(0xFF323B4C),
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Row(
                                children: [
                                  pw.Text(
                                    "DOB: ${Global.dob}",
                                    style: pw.TextStyle(
                                        fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                                  ),
                                  pw.SizedBox(width: 20),
                                  pw.Text(
                                    "Nationality: ${Global.nationality}",
                                    style: pw.TextStyle(
                                        fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                                  ),
                                ],
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "Marital Status: ${Global.maritalStatus}",
                                style: pw.TextStyle(
                                    fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "Languages Known:-",
                                style: pw.TextStyle(
                                    fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                              ),
                              ...Global.languages.map((e) {
                                return (e["isSelect"] == true)
                                    ? pw.Text(
                                  "   ${e["language"]}",
                                  style: pw.TextStyle(
                                      fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                                )
                                    : pw.Container();
                              }),
                            ],
                          ),
                        ),
                      ),
                      //TODO:Experience
                      pw.Expanded(
                        flex: 5,
                        child: pw.Container(
                          padding: pw.EdgeInsets.only(left: 20, top: 3, bottom: 3),
                          width: double.infinity,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "Experience",
                                style: pw.TextStyle(
                                    fontSize: 18,
                                    color: PdfColor.fromInt(0xFF323B4C),
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Container(
                                  color: PdfColor.fromInt(0xFF323B4C),
                                  height: 1,
                                  width: double.infinity),
                              pw.SizedBox(height: 5),
                              (Global.dateExit != null)
                                  ? pw.Text(
                                "${Global.dateJoined} - ${Global.dateExit}",
                                style: pw.TextStyle(
                                    fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                              )
                                  : pw.Text(
                                "${Global.dateJoined} - Current",
                                style: pw.TextStyle(
                                    fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.companyName}",
                                style: pw.TextStyle(
                                    fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.position}",
                                style: pw.TextStyle(
                                    fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.roleDescription}",
                                style: pw.TextStyle(
                                    fontSize: 8, color: PdfColor.fromInt(0xFF323B4C)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //TODO:Projects
                      pw.Expanded(
                        flex: 5,
                        child: pw.Container(
                          padding: pw.EdgeInsets.only(left: 20, top: 3, bottom: 3),
                          width: double.infinity,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "Project",
                                style: pw.TextStyle(
                                    fontSize: 18,
                                    color: PdfColor.fromInt(0xFF323B4C),
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Container(
                                  color: PdfColor.fromInt(0xFF323B4C),
                                  height: 1,
                                  width: double.infinity),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.projectTitle}",
                                style: pw.TextStyle(
                                    fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.projectRoles}",
                                style: pw.TextStyle(
                                    fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                "${Global.projectDescription}",
                                style: pw.TextStyle(
                                    fontSize: 8, color: PdfColor.fromInt(0xFF323B4C)),
                              ),
                              pw.SizedBox(height: 5),
                              ...Global.projectTechnologies.map((e) {
                                return (e["isSelect"] == true)
                                    ? pw.Row(
                                  children: [
                                    pw.Container(
                                      width: 7,
                                      height: 7,
                                      decoration: pw.BoxDecoration(
                                          color: PdfColor.fromInt(0xFF323B4C),
                                          shape: pw.BoxShape.circle),
                                    ),
                                    pw.SizedBox(
                                      width: 4,
                                    ),
                                    pw.Text(
                                      "${e["technology"]}",
                                      style: pw.TextStyle(
                                          fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                                    ),
                                  ],
                                )
                                    : pw.Container();
                              }),
                            ],
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 5,
                        child: pw.Row(
                          children: [
                            //TODO:CareerObjective
                            pw.Expanded(
                              child: pw.Container(
                                padding:
                                pw.EdgeInsets.only(left: 20, top: 3, bottom: 3),
                                width: double.infinity,
                                child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      "Objective",
                                      style: pw.TextStyle(
                                          fontSize: 18,
                                          color: PdfColor.fromInt(0xFF323B4C),
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.Container(
                                        color: PdfColor.fromInt(0xFF323B4C),
                                        height: 1,
                                        width: double.infinity),
                                    pw.SizedBox(height: 5),
                                    pw.Text(
                                      "${Global.careerObjective}",
                                      style: pw.TextStyle(
                                          fontSize: 8, color: PdfColor.fromInt(0xFF323B4C)),
                                    ),
                                    pw.SizedBox(height: 5),
                                    pw.Text(
                                      "Current Designation:-",
                                      style: pw.TextStyle(
                                          fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                                    ),
                                    pw.SizedBox(height: 5),
                                    pw.Text(
                                      "${Global.currentDesignation}",
                                      style: pw.TextStyle(
                                          fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //TODO:Achievements
                            pw.Expanded(
                              child: pw.Container(
                                padding:
                                pw.EdgeInsets.only(left: 20, top: 3, bottom: 3),
                                width: double.infinity,
                                child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      "Achievements",
                                      style: pw.TextStyle(
                                          fontSize: 18,
                                          color: PdfColor.fromInt(0xFF323B4C),
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.Container(
                                        color: PdfColor.fromInt(0xFF323B4C),
                                        height: 1,
                                        width: double.infinity),
                                    pw.SizedBox(height: 5),
                                    ...Global.achievements.map((e) {
                                      return pw.Row(
                                        children: [
                                          pw.Container(
                                            width: 7,
                                            height: 7,
                                            decoration: pw.BoxDecoration(
                                                color: PdfColor.fromInt(0xFF323B4C),
                                                shape: pw.BoxShape.circle),
                                          ),
                                          pw.SizedBox(
                                            width: 4,
                                          ),
                                          pw.Text(
                                            "${e.text}",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                color: PdfColor.fromInt(0xFF323B4C)),
                                          ),
                                        ],
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Expanded(
                        flex: 4,
                        child: pw.Row(
                          children: [
                            //TODO:Hobbies
                            pw.Expanded(
                              child: pw.Container(
                                padding:
                                pw.EdgeInsets.only(left: 20, top: 3, bottom: 3),
                                width: double.infinity,
                                child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      "Hobbies",
                                      style: pw.TextStyle(
                                          fontSize: 18,
                                          color: PdfColor.fromInt(0xFF323B4C),
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.Container(
                                        color: PdfColor.fromInt(0xFF323B4C),
                                        height: 1,
                                        width: double.infinity),
                                    pw.SizedBox(height: 5),
                                    ...Global.hobbies.map((e) {
                                      return pw.Row(
                                        children: [
                                          pw.Container(
                                            width: 7,
                                            height: 7,
                                            decoration: pw.BoxDecoration(
                                                color: PdfColor.fromInt(0xFF323B4C),
                                                shape: pw.BoxShape.circle),
                                          ),
                                          pw.SizedBox(
                                            width: 4,
                                          ),
                                          pw.Text(
                                            "${e.text}",
                                            style: pw.TextStyle(
                                                fontSize: 12,
                                                color: PdfColor.fromInt(0xFF323B4C)),
                                          ),
                                        ],
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ),
                            //TODO:Declaration
                            pw.Expanded(
                              child: pw.Container(
                                padding:
                                pw.EdgeInsets.only(left: 20, top: 3, bottom: 3),
                                width: double.infinity,
                                child: pw.Column(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      "Declaration",
                                      style: pw.TextStyle(
                                          fontSize: 18,
                                          color: PdfColor.fromInt(0xFF323B4C),
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.Container(
                                        color: PdfColor.fromInt(0xFF323B4C),
                                        height: 1,
                                        width: double.infinity),
                                    pw.SizedBox(height: 5),
                                    pw.Text(
                                      "${Global.declarationDescription}",
                                      style: pw.TextStyle(
                                          fontSize: 8, color: PdfColor.fromInt(0xFF323B4C)),
                                    ),
                                    pw.SizedBox(height: 5),
                                    pw.Text(
                                      "${Global.declarationDate}",
                                      style: pw.TextStyle(
                                          fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                                    ),
                                    pw.SizedBox(height: 5),
                                    pw.Text(
                                      "Place:${Global.declarationPlace}",
                                      style: pw.TextStyle(
                                          fontSize: 12, color: PdfColor.fromInt(0xFF323B4C)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() async {
                Directory? res = await getExternalStorageDirectory();
                String? path = res!.path;
                File? file = File("$path/resume.pdf");
                await file.writeAsBytes(await pdf.save()).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      content: Text("Saved successfully"),
                    ),
                  );
                });
              });
            },
            child: Icon(Icons.download),
          ),
          FloatingActionButton(
            onPressed: () async {
              Printing.layoutPdf(
                onLayout: (format) {
                  return pdf.save();
                },
              );
            },
            child: Icon(Icons.print),
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Preview",
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
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFF323B4C),
              child: Column(
                children: [
                  //TODO:ProfileImage
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: (Global.profileImage != null)
                          ? CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(Global.profileImage!),
                            )
                          : CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.transparent,
                              child: Image.asset("images/user.png"),
                            ),
                    ),
                  ),
                  //TODO:Contact
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 3, bottom: 3),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              color: Colors.white,
                              height: 1,
                              width: double.infinity),
                          SizedBox(height: 5),
                          Text(
                            "Phone",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Text(
                            "${Global.phone}",
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Email",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Text(
                            "${Global.email}",
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Address",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Text(
                            "${Global.address1}",
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                          Text(
                            "${Global.address2}",
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                          Text(
                            "${Global.address3}",
                            style: TextStyle(fontSize: 8, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //TODO:Education
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 3, bottom: 3),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Education",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              color: Colors.white,
                              height: 1,
                              width: double.infinity),
                          SizedBox(height: 5),
                          Text(
                            "${Global.yearOfPassing}",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${Global.degree}",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${Global.college}",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${Global.grade}",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //TODO:TechnicalSkills
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 3, bottom: 3),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expertise",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              color: Colors.white,
                              height: 1,
                              width: double.infinity),
                          SizedBox(height: 5),
                         ...Global.technicalSkills.map((e) {
                           return  Row(
                             children: [
                               Container(
                                 width: 7,
                                 height: 7,
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     shape: BoxShape.circle),
                               ),
                               SizedBox(
                                 width: 4,
                               ),
                               Text(
                                 "${e.text}",
                                 style: TextStyle(
                                     fontSize: 12, color: Colors.white),
                               ),
                             ],
                           );
                         }),
                        ],
                      ),
                    ),
                  ),
                  //TODO:References
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 3, bottom: 3),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "References",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              color: Colors.white,
                              height: 1,
                              width: double.infinity),
                          SizedBox(height: 5),
                          Text(
                            "${Global.referenceName}",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${Global.referenceDesignation}",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${Global.referenceInstitute}",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  //TODO:PersonalInfo
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 3, bottom: 3),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            "${Global.name}",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFF323B4C),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "DOB: ${Global.dob}",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF323B4C)),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "Nationality: ${Global.nationality}",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF323B4C)),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Marital Status: ${Global.maritalStatus}",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF323B4C)),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Languages Known:-",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF323B4C)),
                          ),
                          ...Global.languages.map((e) {
                            return (e["isSelect"] == true)
                                ? Text(
                                    "   ${e["language"]}",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xFF323B4C)),
                                  )
                                : Container();
                          }),
                        ],
                      ),
                    ),
                  ),
                  //TODO:Experience
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 3, bottom: 3),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Experience",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF323B4C),
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              color: Color(0xFF323B4C),
                              height: 1,
                              width: double.infinity),
                          SizedBox(height: 5),
                          (Global.dateExit != null)
                              ? Text(
                                  "${Global.dateJoined} - ${Global.dateExit}",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFF323B4C)),
                                )
                              : Text(
                                  "${Global.dateJoined} - Current",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFF323B4C)),
                                ),
                          SizedBox(height: 5),
                          Text(
                            "${Global.companyName}",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF323B4C)),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${Global.position}",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF323B4C)),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${Global.roleDescription}",
                            style: TextStyle(
                                fontSize: 8, color: Color(0xFF323B4C)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //TODO:Projects
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 3, bottom: 3),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Project",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF323B4C),
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              color: Color(0xFF323B4C),
                              height: 1,
                              width: double.infinity),
                          SizedBox(height: 5),
                          Text(
                            "${Global.projectTitle}",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF323B4C)),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${Global.projectRoles}",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF323B4C)),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${Global.projectDescription}",
                            style: TextStyle(
                                fontSize: 8, color: Color(0xFF323B4C)),
                          ),
                          SizedBox(height: 5),
                          ...Global.projectTechnologies.map((e) {
                            return (e["isSelect"] == true)
                                ? Row(
                              children: [
                                Container(
                                  width: 7,
                                  height: 7,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF323B4C),
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "${e["technology"]}",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFF323B4C)),
                                ),
                              ],
                            )
                                : Container();
                          }),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        //TODO:CareerObjective
                        Expanded(
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 20, top: 3, bottom: 3),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Objective",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF323B4C),
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    color: Color(0xFF323B4C),
                                    height: 1,
                                    width: double.infinity),
                                SizedBox(height: 5),
                                Text(
                                  "${Global.careerObjective}",
                                  style: TextStyle(
                                      fontSize: 8, color: Color(0xFF323B4C)),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Current Designation:-",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFF323B4C)),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${Global.currentDesignation}",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFF323B4C)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //TODO:Achievements
                        Expanded(
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 20, top: 3, bottom: 3),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Achievements",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF323B4C),
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    color: Color(0xFF323B4C),
                                    height: 1,
                                    width: double.infinity),
                                SizedBox(height: 5),
                                ...Global.achievements.map((e) {
                                  return Row(
                                    children: [
                                      Container(
                                        width: 7,
                                        height: 7,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF323B4C),
                                            shape: BoxShape.circle),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "${e.text}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF323B4C)),
                                      ),
                                    ],
                                  );
                                })
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        //TODO:Hobbies
                        Expanded(
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 20, top: 3, bottom: 3),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hobbies",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF323B4C),
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    color: Color(0xFF323B4C),
                                    height: 1,
                                    width: double.infinity),
                                SizedBox(height: 5),
                                ...Global.hobbies.map((e) {
                                  return Row(
                                    children: [
                                      Container(
                                        width: 7,
                                        height: 7,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF323B4C),
                                            shape: BoxShape.circle),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "${e.text}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF323B4C)),
                                      ),
                                    ],
                                  );
                                })
                              ],
                            ),
                          ),
                        ),
                        //TODO:Declaration
                        Expanded(
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 20, top: 3, bottom: 3),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Declaration",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF323B4C),
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    color: Color(0xFF323B4C),
                                    height: 1,
                                    width: double.infinity),
                                SizedBox(height: 5),
                                Text(
                                  "${Global.declarationDescription}",
                                  style: TextStyle(
                                      fontSize: 8, color: Color(0xFF323B4C)),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "${Global.declarationDate}",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFF323B4C)),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Place:${Global.declarationPlace}",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFF323B4C)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
