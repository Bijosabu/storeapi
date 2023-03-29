import 'package:flutter/material.dart';
import 'package:storeapp/widgets/user_widget.dart';
import 'package:storeapp/apiServices/api_calls.dart';
import 'package:provider/provider.dart';
import 'package:storeapp/Models/userModel/user_model/user_model.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.deepPurple[400]),
          backgroundColor: Colors.grey[200],
          centerTitle: true,
          title: const Text(
            'Users',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder<List<UserModel>>(
          future: ApiCalls().getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                      value: snapshot.data![index], child: UserWidget());
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
