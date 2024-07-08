import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_albaraka_statemangment/core/res/colors_project.dart';
import 'package:project_albaraka_statemangment/core/res/string_project.dart';
import 'package:project_albaraka_statemangment/feature/bloc/bloc/project_create_bloc.dart';

import '../../model/createproject_model.dart';
import 'add_task_page.dart';

class createproject_page extends StatelessWidget {
  createproject_page({super.key});
  final TextEditingController Projectnamefield = TextEditingController();
  final TextEditingController Projectscriptfield = TextEditingController();
  final TextEditingController Projectstatusfield = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectCreateBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
            backgroundColor: background,
            body: Expanded(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Image.asset(
                        "images/Group 34.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: Text(
                      Projectname,
                      style: Projectnamestyle,
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        cursorWidth: 5.2,
                        cursorColor: Colors.black,
                        // maxLines: 1,
                        controller: Projectnamefield,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: Text(
                      Projectname,
                      style: Projectnamestyle,
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        cursorWidth: 5.2,
                        cursorColor: Colors.black,
                        maxLines: 10,
                        controller: Projectscriptfield,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  BlocConsumer<ProjectCreateBloc, ProjectCreateState>(
                    listener: (context, state) {
                      if (state is ProjectCreatesuccess) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => add_task_page(
                              id: 1,
                            ),
                          ),
                        );
                      }
                      if (state is ProjectCreatefailure) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Placeholder(),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is ProjectCreateInitial) {
                        return InkWell(
                          onTap: () {
                            print(Projectnamefield.text);
                            print(Projectscriptfield.text);
                            context.read<ProjectCreateBloc>().add(
                                  project(
                                    projectsevent: ProjectModel(
                                      projectName: Projectnamefield.text,
                                      projectDescription:
                                          Projectscriptfield.text,
                                      projectStatus: "NEW",
                                    ),
                                  ),
                                );
                          },
                          child: Container(
                            width: 290,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: secondary),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(create,
                                  textAlign: TextAlign.center,
                                  style: containerlog_sing_create),
                            ),
                          ),
                        );
                      } else if (State is ProjectCreatefailure) {
                        return SizedBox(
                          height: 300,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<ProjectCreateBloc>().add(
                                        project(
                                          projectsevent: ProjectModel(
                                            projectDescription:
                                                Projectscriptfield.text,
                                            projectName:
                                                Projectscriptfield.text,
                                            projectStatus: 'NEW',
                                          ),
                                        ),
                                      );
                                },
                                child: Container(
                                  width: 300,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: secondary),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(create,
                                        textAlign: TextAlign.center,
                                        style: containerlog_sing_create),
                                  ),
                                ),
                              ),
                              Text(
                                error,
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red),
                              )
                            ],
                          ),
                        );
                      } else if (state is ProjectCreatesuccess) {
                        return Container(
                          width: 300,
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(success,
                                textAlign: TextAlign.center,
                                style: containerlog_sing_create),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
