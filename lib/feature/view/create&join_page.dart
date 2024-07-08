import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../core/res/colors_project.dart';
import '../../core/res/string_project.dart';
import 'createproject_page.dart';

class create_join_page extends StatelessWidget {
  const create_join_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  alignment: Alignment.center,
                  "images/Polygon 2.png",
                  width: 300,
                  height: 300,
                ),
                Positioned(
                  top: 50,
                  right: 150,
                  child: Image.asset(
                    "images/yeti4983743 1.png",
                    width: 200,
                    height: 200,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 70,
                  child: Image.asset(
                    "images/OSSCAM “.png",
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),
            Spacer(flex: 1),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => createproject_page(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: 290,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: secondary),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(create,
                        textAlign: TextAlign.center,
                        style: containerlog_sing_create),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 290,
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(color: secondary),
                    borderRadius: BorderRadius.circular(15),
                    color: background),
                child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(child: Icon(Icons.add)),
                        ),
                        // Icon(Icons.add_box_rounded, color: secondary),
                        Text(Join,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: secondary, fontSize: 30)),
                      ],
                    )),
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
