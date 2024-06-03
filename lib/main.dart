// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_ui_exame/core/config.dart';
import 'package:flutter_ui_exame/model/pepolemodel.dart';
import 'package:flutter_ui_exame/service/get_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: inventsFrinds(),
      home: core.get<SharedPreferences>().getString('USERNAME') == null &&
              core.get<SharedPreferences>().getString('PASSWORD') == null
          ? LogInPage()
          : inventsFrinds(),
    );
  }
}

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(child: Image.asset("images/Group.png")),
          ),
          const Text(
            "Welcome to RIIDE",
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 20),
          ),
          Expanded(
            flex: 2,
            //   child: Align(
            // alignment: Alignment.center,
            child: Container(
              // color: Colors.white,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        const Text(
                          textAlign: TextAlign.start,
                          "USERNAME",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 400,
                            child: TextField(
                              onChanged: (value) {
                                core
                                    .get<SharedPreferences>()
                                    .setString('USERNAME', value);
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Email or username",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          "PASSWORD",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 400,
                            child: TextField(
                              onChanged: (value) {
                                core
                                    .get<SharedPreferences>()
                                    .setString('PASSWORD', value);
                              },
                              decoration: InputDecoration(
                                hintText: "Enter your password",
                                hintStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Remember me",
                                style: TextStyle(color: Colors.white)),
                            Text(
                              "forgot password",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(80.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => inventsFrinds(),
                                      ));
                                },
                                child: Container(
                                  width: 400,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.green),
                                  child: const Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text("Sing in",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "don't have an accont?",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  InkWell(
                                    child: Text(
                                      "Sing up",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class inventsFrinds extends StatefulWidget {
  inventsFrinds({super.key});

  @override
  State<inventsFrinds> createState() => _inventsFrindsState();
}

class _inventsFrindsState extends State<inventsFrinds> {
  List<pepole> result = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: Image.asset("Mapsicle Map.png").image)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  child: Icon(Icons.arrow_back_rounded),
                ),
                Text(
                  "invite friends",
                  style: TextStyle(color: Colors.white),
                ),
                CircleAvatar(
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getpepoleData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<pepole> pepo = snapshot.data as List<pepole>;
                  result = pepo;
                  return StatefulBuilder(builder: (context, refresh) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 300,
                                child: TextField(
                                  onChanged: (value) {
                                    result = [];
                                    refresh(() {
                                      pepo.forEach(
                                        (element) {
                                          if (element.name.contains(value)) {
                                            result.add(element);
                                          }
                                        },
                                      );
                                      core
                                          .get<SharedPreferences>()
                                          .setString('result', value);
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Icon(Icons.search)
                          ],
                        ),
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                            itemCount: result.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => inventsFrinds1(
                                              pepole: result[index]),
                                        ));
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Image(
                                          image:
                                              Image.network(result[index].image)
                                                  .image),
                                    ),
                                    title: Text(
                                      result[index].name,
                                    ),
                                    subtitle: Text(
                                      result[index].message,
                                    ),
                                    trailing: Text(result[index].date),
                                  ));
                            },
                          ),
                        )
                      ],
                    );
                  });
                } else {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 300,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Icon(Icons.search)
                        ],
                      ),
                      LinearProgressIndicator()
                    ],
                  );
                }
              },
            ),
          )

          // Expanded(
          //     child: FutureBuilder(
          //         future: getpepoleData(),
          //         builder: (context, snapshot) {
          //           if (snapshot.hasData) {
          //             return Center(
          //               child: Container(
          //                 // color: Colors.black,
          //                 width: 700,
          //                 height: 700,
          //                 // color: const Color.fromARGB(200, 199, 117, 145),
          //                 child: Column(
          //                   children: [
          //                     SizedBox(
          //                         height: 400,
          //                         // width: 200,
          //                         child: ListView.builder(
          //                             itemCount: snapshot.data!.length,
          //                             itemBuilder: (context, index) {
          //                               return ListTile(
          //                                 leading: CircleAvatar(
          //                                   child: Image(
          //                                       image: Image.network(snapshot
          //                                               .data![index].image)
          //                                           .image),
          //                                 ),
          //                                 title: Text(
          //                                   snapshot.data![index].name,
          //                                 ),
          //                                 subtitle: Text(
          //                                   snapshot.data![index].message,
          //                                 ),
          //                                 trailing:
          //                                     Text(snapshot.data![index].date),
          //                               );
          //                             }))
          //                   ],
          //                 ),
          //               ),
          //             );
          //           } else {
          //             return const CircularProgressIndicator();
          //           }
          //         }))
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class inventsFrinds1 extends StatelessWidget {
  const inventsFrinds1({super.key, required pepole pepole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: Image.asset("Mapsicle Map.png").image)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  child: Icon(Icons.arrow_back_rounded),
                ),
                Text(
                  "invite friends",
                  style: TextStyle(color: Colors.white),
                ),
                CircleAvatar(
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          "images/Artwork.jpg",
                          height: 200,
                        ),
                      ),
                      const Text("invinte Friends",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Center(
                        child: const Text(
                            "Sing up a friend with your referral \n code and earn \$RIIDE and /or free rides.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 400,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Share your invite code",
                              hintStyle: const TextStyle(
                                  color: Colors.white70, fontSize: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text("invinte Friends",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
