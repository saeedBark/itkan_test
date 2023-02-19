import 'package:flutter/material.dart';
import 'package:itkan_test/models/home_book_model.dart';

Widget MyDiver() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey,
  ),
);
//----- button -------//
Widget defaultButton({
  Color color = Colors.orangeAccent,
  double width = double.infinity,
  double raduis = 15,
  bool isUpperCase = true,
  required Function fanction,
  required String text,
}) {
  return Center(
    child: Container(
      height: 40,
      width: 300,
      child: MaterialButton(
        onPressed: () {
          fanction();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: color,
      ),
    ),
  );
}
//-------- TextFormField-----/
Widget defaultFormFile({
  required TextEditingController controller,
  Function? onsubmit,
  required Function validator,
  required String lable,
  required IconData prefix,
  Function? onTap,
  TextInputType? type,
  IconData? suffix,
  bool enable = true,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: type,
      onFieldSubmitted: (d) {
        onsubmit!(d);
      },
      validator: (m) {
        validator(m);
      },
      onTap: () {
        onTap!();
      },
      enabled: enable,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null ? Icon(suffix) : null,
        border: OutlineInputBorder(),
      ),
    );

//------ navigator -----//
void navigatorTo(context, Widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ));
//-------- navigator and finish -------//
void navigatorAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => Widget,
  ),
      (Route<dynamic> route) => false,
);
//------------builderBookItem-----//
Widget builderListBooks(ResualtModel model,ImagUrl imageUrl,AuthorsModel auther,context) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 100,
        width: 100,
        decoration:  BoxDecoration (
          borderRadius:  BorderRadius.all( Radius.circular(50.0)),
          color: Colors.red,

        ),
        child: Image(
          image: NetworkImage(
            '${imageUrl.image}',
          ),
          height: 50,
          width: 50,
          fit: BoxFit.cover,

        ),

      ),
      SizedBox(width: 5,),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text(
              '${model.title}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13, height: 1.3),
            ),
            SizedBox(width: 3,),
            Text('${auther.name}',style: TextStyle(fontSize: 20,color: Colors.grey),),
          ],
        ),
      )



    ],
  ),
);
