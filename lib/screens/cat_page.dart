import 'package:flutter/material.dart';
import 'package:resume_builder/util/util.dart';

class CatPage extends StatefulWidget {
  const CatPage({super.key});

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Resume Workspace",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        leading: InkWell(onTap: () {
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back_ios_new,color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              color: Colors.redAccent,
              child: Text(
                "Build Options",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.black12,
              child: SingleChildScrollView(
                child: Column(
                  children: catList.map((e)  {
                    return CatBox(map: e);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CatBox extends StatefulWidget {
  Map? map;
  CatBox({super.key,this.map});

  @override
  State<CatBox> createState() => _CatBoxState();
}

class _CatBoxState extends State<CatBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      padding:  EdgeInsets.all(12),
      height: 60,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image.asset(widget.map?["image"],height: 50,width: 50),
          SizedBox(width: 10),
          Text(widget.map?["name"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, widget.map?["screen"]);
            },
            icon: Icon(Icons.navigate_next,size: 25),
            splashRadius: 20,
          ),
        ],
      ),
    );
  }
}