import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_albaraka_statemangment/core/res/colors_project.dart';
import 'package:project_albaraka_statemangment/feature/bloc/authe_bloc/authe_bloc.dart';
import 'package:project_albaraka_statemangment/feature/view/createproject_page.dart';
import 'package:project_albaraka_statemangment/model/signup_user_model.dart';

import '../../core/res/string_project.dart';
import 'create&join_page.dart';
import 'login_page.dart';

class singup_page extends StatelessWidget {
  singup_page({super.key});
  final TextEditingController lastName = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AutheBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: background,
          body: Center(
            child: Container(
              height: 650,
              width: 400,
              child: Column(
                children: [
                  Expanded(
                      child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Center(
                        child: Container(
                          width: 290,
                          height: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(
                                    flex: 2,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(USERNAME,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 45,
                                      child: TextField(
                                        controller: firstName,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: primary,
                                          hintText: EXAMPLE,
                                          hintStyle: textfild,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(EMAIL,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 45,
                                      child: TextField(
                                        controller: email,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: primary,
                                          hintText: "Example@gmail.come",
                                          hintStyle: textfild,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(PASSWORD,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 45,
                                      child: TextField(
                                        controller: password,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: primary,
                                          // hintStyle: TextStyle(inherit: false),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: secondary),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(REMEMBERME,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w100)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: secondary,
                                  borderRadius: BorderRadius.circular(50)),
                              width: 100,
                              height: 100,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(50)),
                              width: 90,
                              height: 90,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Image.asset(
                                "images/Intersect.png",
                                width: 80,
                                height: 80,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  BlocConsumer<AutheBloc, AutheState>(
                    listener: (context, state) {
                      if (state is SuccessToRegister) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => create_join_page(),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AutheInitial) {
                        return InkWell(
                          onTap: () {
                            context.read<AutheBloc>().add(
                                  Register(
                                    user: SignupUserModel(
                                      lastName: lastName.text,
                                      firstName: firstName.text,
                                      email: email.text,
                                      role: 'USER',
                                      password: password.text,
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
                              child: Text(SINGUP,
                                  textAlign: TextAlign.center,
                                  style: containerlog_sing_create),
                            ),
                          ),
                        );
                      } else if (State is Failed) {
                        return SizedBox(
                          height: 300,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<AutheBloc>().add(
                                        Register(
                                          user: SignupUserModel(
                                            lastName: lastName.text,
                                            firstName: firstName.text,
                                            email: email.text,
                                            role: 'USER',
                                            password: password.text,
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
                                    child: Text(SINGUP,
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
                      } else if (state is SuccessToRegister) {
                        return Container(
                          width: 290,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ALREADYHAVEANACCOUNT,
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: context.read<AutheBloc>(),
                                  child: login_page(),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            LOGIN,
                            style: TextStyle(color: primary),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
