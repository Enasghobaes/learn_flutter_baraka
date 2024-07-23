import 'package:flutter/material.dart';
import 'package:project_supabase_albaraka/main.dart';

class QusetionPageStudentFemale extends StatefulWidget {
  const QusetionPageStudentFemale({super.key});

  @override
  State<QusetionPageStudentFemale> createState() =>
      _QusetionPageStudentFemaleState();
}

class _QusetionPageStudentFemaleState extends State<QusetionPageStudentFemale> {
  TextEditingController answer = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream:
              supabase.from('question_student_f').stream(primaryKey: ['id']),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("mmmmmmmmmmmmmmmmmmmmmmm ${snapshot.data}");
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListView(
                            children: [
                              Text(snapshot.data![index].values.elementAt(2)),
                              Center(
                                child: TextField(
                                    controller: answer,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    )),
                              )
                            ],
                          );

                          // return snapshot.data![index].values.elementAt(1)
                          //         as bool
                          //     ? SizedBox(
                          //         width: 100,
                          //         height: 60,
                          //         child: Align(
                          //           alignment: Alignment.center,
                          //           child: Card(
                          //             child: Container(
                          //               decoration: BoxDecoration(
                          //                   color: Colors.blue,
                          //                   borderRadius:
                          //                       BorderRadius.circular(20)),
                          //               width: 300,
                          //               height: 100,
                          //               child: Center(
                          //                 child: Text(snapshot
                          //                     .data![index].values
                          //                     .elementAt(1)
                          //                     .toString()),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     : SizedBox(
                          //         width: 100,
                          //         height: 60,
                          //         child: Align(
                          //           alignment: Alignment.center,
                          //           child: Card(
                          //             child: Container(
                          //                 decoration: BoxDecoration(
                          //                     borderRadius:
                          //                         BorderRadius.circular(20)),
                          //                 width: 300,
                          //                 height: 100,
                          //                 child: TextField(
                          //                     controller: answer,
                          //                     decoration: InputDecoration(
                          //                       border: OutlineInputBorder(
                          //                           borderRadius:
                          //                               BorderRadius.circular(
                          //                                   20)),
                          //                     ))),
                          //           ),
                          //         ),
                          //       );
                        }),
                  ),
                  MaterialButton(
                    textColor: Colors.white,
                    color: Colors.purple,
                    onPressed: () async {
                      var req = await supabase
                          .from('question_student_f')
                          .insert({'answer': answer.text}).select();
                    },
                    child: Text("Save"),
                  )
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
