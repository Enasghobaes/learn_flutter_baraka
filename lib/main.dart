import 'package:flutter/material.dart';
import 'package:project_supabase_albaraka/pages/question_page_student_f.dart';
import 'package:project_supabase_albaraka/pages/singup_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
      // url: 'https://hxnimcfbvqoqhraeoqyg.supabase.co',
      url: 'https://hxnimcfbvqoqhraeoqyg.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4bmltY2ZidnFvcWhyYWVvcXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjA4MDIwNTgsImV4cCI6MjAzNjM3ODA1OH0.l0kFAB9XFJHZfZDkA5bHjuSThcVOy8wbx4po3N5wFM0'
      // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh4bmltY2ZidnFvcWhyYWVvcXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjA4MDIwNTgsImV4cCI6MjAzNjM3ODA1OH0.l0kFAB9XFJHZfZDkA5bHjuSThcVOy8wbx4po3N5wFM0',
      );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: singup_page(),
    );
  }
}
