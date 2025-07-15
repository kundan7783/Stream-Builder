import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilderScreen(),
    );
  }
}
class StreamBuilderScreen extends StatefulWidget {
  const StreamBuilderScreen({super.key});

  @override
  State<StreamBuilderScreen> createState() => _StreamBuilderScreenState();
}

class _StreamBuilderScreenState extends State<StreamBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Builder Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: StreamBuilder(stream: getStreamBuilder(), builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else if(snapshot.hasError){
              return Text('Error: ${snapshot.error}');
            }
            else{
              return Text(
                'Count: ${snapshot.data}',
                style: TextStyle(fontSize: 30),
              );
            }
          },
        ),
      ),
    );
  }
  Stream<int> getStreamBuilder(){
    return Stream.periodic(Duration(seconds: 2), (count) => count);
  }
}

