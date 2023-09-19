import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    
    void getData() async {
      CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("tbestudiantes");
      QuerySnapshot mensajes = await collectionReference.get();
      if(mensajes.docs.length != 0){
      for (var doc in mensajes.docs){
      print(doc.data());
      //chatsx.add(doc.data());
      }
      }
    }


Future<List> getMensajes() async {
    List chats = [];
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("tbchat");
    QuerySnapshot mensajes = await collectionReference.get();
    if(mensajes.docs.length != 0){
    for (var doc in mensajes.docs){
    print(doc.data());
    chats.add(doc.data());
    }
 }
    return chats;
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getData();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

}