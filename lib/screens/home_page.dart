import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Resume Builder",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
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
                "Resumes",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Image.asset("images/open-cardboard-box.png",
                      height: 60, width: 60),
                  Text(
                    "No resumes + to create a new one",
                    style: TextStyle(color: Colors.black54, fontSize: 22),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "catpage");
          },
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.redAccent),
    );
  }
}