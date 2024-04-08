import 'package:flutter/material.dart';
import 'package:webkul1/bloc/flutter_bloc.dart';
import 'package:webkul1/ui/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkul1/ui/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => FlutterBloc(),
      child: MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignInPage()
    )
    );
  }
}
