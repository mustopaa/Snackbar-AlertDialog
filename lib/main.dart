import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    showToast(){
      setState(() {
        Fluttertoast.showToast(msg: 'Ini Notifikasi Toast',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER
        );
      });
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Latihan Notifikasi"),),
        body: Center(
          child: Builder(
            builder: (context) => Column(   
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(onPressed: (){showToast();}, child: Text("show Toast"),),
              MaterialButton(onPressed: (){showAlert(context);}, child: Text("show ALert"),)
            ],
            ),
             ),
      ),
    ),
    );
  }
  void showAlert(BuildContext context){
      setState(() {
        Widget buttonOk = MaterialButton(
          child: Text("OK"),
          onPressed: (){
            Navigator.of(context).pop();          
          },
          );

        Widget buttonCancel = MaterialButton(
          child: Text("CANCEL"),
          onPressed: (){
            Navigator.of(context).pop();          
          },
          );

          AlertDialog alert = AlertDialog(
            title: Text("Simple Alert"),
            content: Text("Notikasi dari Alert "),
            actions: [
              buttonOk,
              buttonCancel,
            ],
          );
          showDialog(context: context,
           builder: (BuildContext context) {
            return alert;
           });
      });
    }
}
class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Mustopa',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SnackBar Mustopa'),
        ),
        body: const SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Ini merupakan sebuah pesan dari SnackBar '),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show SnackBar'),
      ),
    );
  }
}