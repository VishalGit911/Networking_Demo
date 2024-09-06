import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model_class.dart';

class Userdata extends StatefulWidget {
  const Userdata({super.key});

  @override
  State<Userdata> createState() => _UserdataState();
}

class _UserdataState extends State<Userdata> {
  List<UserData1> userdatanew = [];

  Future<List<UserData1>> getdata() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));

    if (response.statusCode == 200) {
      userdatanew = userDataFromJson(response.body);
    }
    return userdatanew;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Netweorking "),
      ),
      body: FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.hasError}"),
            );
            } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: userdatanew.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(userdatanew[index].id.toString()),
                  subtitle: Text(userdatanew[index].title),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
