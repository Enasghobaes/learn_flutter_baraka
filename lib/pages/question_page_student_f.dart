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
              // supabase.from('question_student_f').stream(primaryKey: ['id']),
              supabase.from('question_student_f').select('*').asStream(),
          builder: (context, snapshot) {
            print(
                "sssssssssssssssssssssssssssssssssssssss ${supabase.from('question_student_f').select('*').asStream()}");
            if (snapshot.hasData) {
              print("mmmmmmmmmmmmmmmmmmmmmmm ${snapshot.data}");
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    print(
                        "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww ${snapshot.data![index].values.elementAt(1)}");
                    return Column(
                      // physics: ScrollPhysics(),
                      // scrollDirection: Axis.vertical,
                      children: [
                        Container(
                            child: Center(
                                child: Text(snapshot.data![index].values
                                    .elementAt(1)))),
                        Center(
                          child: TextField(
                              controller: answer,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              )),
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
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
