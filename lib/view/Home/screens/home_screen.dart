import 'package:flutter/material.dart';
import 'package:kortoba/service/global/firebase_operations.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/view/Home/widgets/build_body.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseOperations firebaseOperations = Provider.of<FirebaseOperations>(context);
    return Scaffold(
      body: const BuildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          firebaseOperations.showPostImage(context);
        },
        child: Icon(Icons.add,size: context.height30,),
      ),
    );
  }
}
