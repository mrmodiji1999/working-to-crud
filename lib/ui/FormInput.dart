import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkul1/bloc/flutter_bloc.dart';
import 'package:webkul1/bloc/flutter_event.dart';

class DataSendClass extends StatefulWidget {
  const DataSendClass({super.key});

  @override
  State<DataSendClass> createState() => _DataSendClassState();
}

class _DataSendClassState extends State<DataSendClass> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('data add kre huwe'),),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  label: Text('name'), border: OutlineInputBorder()),
              controller: name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  label: Text('passwd'), border: OutlineInputBorder()),
              controller: password,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
                onPressed: () {
                  if (name.text.isEmpty) {
                    snakbar('enter name ');
                  } else if (password.text.isEmpty) {
                    snakbar('enter passwd');
                  } else {
                    snakbar('Data recived success');
                    print('text page se ${name.text}${password.text}');
                    context.read<FlutterBloc>().add(ApiDataSendEvent(email: name.text, passwd: password.text));
                //  name.clear();password.clear();
                  }
                },
                child: Text('submit')),
          )
        ],
      ),
    );
  }

  void snakbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 1), content: Text(message)));
  }
}
