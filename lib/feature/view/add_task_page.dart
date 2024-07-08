import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_albaraka_statemangment/feature/bloc/task_bloc/bloc/task_bloc.dart';
import 'package:project_albaraka_statemangment/model/add_task_model.dart';

import '../../core/res/colors_project.dart';
import '../../core/res/string_project.dart';

TextEditingController add_task_feild = TextEditingController();
String temp = '';

class add_task_page extends StatelessWidget {
  add_task_page({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: Scaffold(
        backgroundColor: background,
        body: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "images/Group 34.png",
                  width: 150,
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(
                    tasks,
                    style: Projectnamestyle,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                  child: Container(
                width: 400,
                height: 618,
                // color: Colors.grey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<TaskBloc, TaskState>(
                      builder: (context, state) {
                        if (state is newtextfieldcreated) {
                          return Container(
                            width: 200,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: state.addtaskTotextfield.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      // width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Container_task,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 10, right: 10),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: temp,
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                          ),
                                          controller:
                                              (state.addtaskTotextfield.length -
                                                          1 ==
                                                      index)
                                                  ? add_task_feild
                                                  : null,
                                          cursorWidth: 2.2,
                                          cursorColor: Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          );
                        } else {
                          return Container(
                            width: 200,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                Container(
                                  // width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Container_task,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 10, right: 10),
                                    child: TextField(
                                      cursorWidth: 5.2,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    Builder(builder: (context) {
                      return InkWell(
                        onTap: () {
                          if (add_task_feild.text == '' ||
                              add_task_feild.text == null) {
                            context.read<TaskBloc>().add(createnewtextfield());
                            add_task_feild.clear();
                          } else {
                            temp = add_task_feild.text;

                            context.read<TaskBloc>().add(
                                  Deletetextfieldevent(
                                    delTask: add_task_model(
                                        taskDescription: add_task_feild.text,
                                        taskStatus: 'NEW',
                                        projectId: id),
                                  ),
                                );
                            context.read<TaskBloc>().add(createnewtextfield());
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 70.0, top: 15),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(child: Icon(Icons.add)),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              )),
            ),
            Container(
              width: 290,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: secondary),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(create,
                    textAlign: TextAlign.center,
                    style: containerlog_sing_create),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
