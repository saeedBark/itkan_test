import 'package:flutter/material.dart';
import 'package:itkan_test/components/componts.dart';
import 'package:itkan_test/screens/home/cubit.dart';
import 'package:itkan_test/screens/search/search.dart';

class HomeBooks extends StatelessWidget {
  const HomeBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            navigatorTo(context, SearchScreenBook());
          }, icon: Icon(Icons.search),color: Colors.black,),
        ],
        backgroundColor: Colors.white,
        title: Text('Itkan Books', style: TextStyle(color: Colors.deepOrange),),
        elevation: 0,
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            builderListBooks(
                BookCubit.get(context).homeModel!.results[index]!),
        separatorBuilder: (context, index) => MyDiver(),
        itemCount: BookCubit.get(context).homeModel.results.length,
      ),
    );
  }


}
