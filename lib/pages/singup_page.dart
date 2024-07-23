import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_supabase_albaraka/main.dart';
import 'package:project_supabase_albaraka/pages/drop_down_list.dart';
import 'package:project_supabase_albaraka/pages/question_page_student_f.dart';
import 'package:project_supabase_albaraka/pages/question_page_student_m.dart';

final stream = supabase.from('person').select('*').asStream();

class singup_page extends StatefulWidget {
  const singup_page({super.key});

  @override
  State<singup_page> createState() => _singup_pageState();
}

class _singup_pageState extends State<singup_page> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController study_case = TextEditingController();

  // @override
  // void initState() {
  //   // fullname = TextEditingController();
  //   // email = TextEditingController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   fullname.dispose();
  //   email.dispose();
  //   gender.dispose();
  //   study_case.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("singup")),
        ),
        body: StreamBuilder(
            stream: stream,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(100.0),
                child: Expanded(
                  // child: Form(
                  //   key: formstate,
                  child: ListView(
                    children: [
                      Center(
                        child: Card(
                          child: TextField(
                              controller: fullname,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              )),
                        ),
                      ),
                      Center(
                        child: Card(
                          child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              )),
                        ),
                      ),
                      Center(
                        child: Card(
                          child: TextField(
                              controller: gender,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              )),
                        ),
                      ),
                      Center(
                        child: Card(
                          child: TextField(
                              controller: study_case,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              )),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: TextFormField(
                      //       validator: (value) {
                      //         if (value!.isEmpty) {
                      //           return "pleass Enter your name";
                      //         }
                      //       },
                      //       controller: fullname,
                      //       decoration: InputDecoration(
                      //           border: OutlineInputBorder(
                      //               borderRadius: BorderRadius.circular(20)),
                      //           label: Text("your name"))),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: TextFormField(
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return "pleass Enter your email";
                      //       }
                      //     },
                      //     controller: email,
                      //     decoration: InputDecoration(
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(20)),
                      //         label: Text("your email")),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: AppTextField(
                      //     textEditingController: study_case,
                      //     title: "Study_Case",
                      //     data_list: [
                      //       SelectedListItem(name: "Student"),
                      //       SelectedListItem(name: "University"),
                      //     ],
                      //     isSelected: true,
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: AppTextField(
                      //     textEditingController: gender,
                      //     title: "gender",
                      //     data_list: [
                      //       SelectedListItem(name: "Male"),
                      //       SelectedListItem(name: "Female"),
                      //     ],
                      //     isSelected: true,
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          onPressed: () async {
                            // if (formstate.currentState!.validate()) {
                            print("jjjjjjjj");
                            print(fullname.text);
                            // var req =
                            await supabase.from('person').insert({
                              'name': fullname.text,
                              'email': email.text,
                              'gender': gender.text,
                              'study_case': study_case,
                            }).select();
                            // print("kkkkkkkkkkkkkk");
                            // var question_student_female = await supabase
                            //     .from('person')
                            //     .select('*')
                            //     .eq('study_case', 'study')
                            //     .eq('gender', 'famele');

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             QusetionPageStudentFemale()));
                            // var question = await supabase
                            //     .from('person')
                            //     .select('*')
                            //     .eq('study_case', 'study')
                            //     .eq('gender', 'male');
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             QuestionPageStudentMale()));
                            // _address.clear();
                            // _fullname.clear();
                            // }else{

                            // }
                          },
                          child: Text("Save"),
                        ),
                      )
                    ],
                  ),
                  // ),
                ),
              );
            }));
  }
}
