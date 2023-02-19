import 'package:flutter/material.dart';
import 'package:itkan_test/components/componts.dart';
import 'package:itkan_test/screens/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Login now to browse our hot offers',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormFile(
                    controller: emailController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your email adress';
                      }
                    },
                    lable: 'Email Adress',
                    prefix: Icons.email_outlined,
                    type: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  defaultFormFile(
                    controller: passwordController,
                    isPassword: true,
                    onTap: () {},
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your password';
                      }
                    },
                    lable: 'Password',
                    prefix: Icons.lock_outlined,
                    suffix: Icons.password),

                  SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                      fanction: () {

                         if (formkey.currentState!.validate()) {
                           navigatorTo(context, HomeBooks());
                         }

                      },  text: 'login',
                      isUpperCase: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
