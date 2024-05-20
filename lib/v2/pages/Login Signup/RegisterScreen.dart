import 'package:flutter/material.dart';
import 'package:indehlizi/Auth.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  //static String routeName = '/signup-email-password';
  const RegisterScreen({Key? key,}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  var passwordController = TextEditingController();
  var usernameController =  TextEditingController();
  var emailController = TextEditingController();
  var verifiPasswordController = TextEditingController();
  var nameController = TextEditingController();
  var lastnameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordTemporalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var displayInfo = MediaQuery.of(context).size;
    var displayHeight = displayInfo.height;
    var displayWidth = displayInfo.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal
                          ),
                        ),
                        labelText: "First Name",
                        labelStyle: TextStyle(
                          color: Colors.teal,
                        ),
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter First Name";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: lastnameController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal
                          ),
                        ),
                        labelText: "Last Name",
                        labelStyle: TextStyle(
                          color: Colors.teal,
                        ),
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter Last Name";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal
                          ),
                        ),
                        labelText: "Username",
                        labelStyle: TextStyle(
                          color: Colors.teal,
                        ),
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Username";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal
                          ),
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.teal,
                        ),
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Email";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal
                          ),
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.teal,
                        ),
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter your password";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: verifiPasswordController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal
                          ),
                        ),
                        labelText: "Verifiy Password",
                        labelStyle: TextStyle(
                          color: Colors.teal,
                        ),
                        border: OutlineInputBorder()
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Verifiy Password";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: (){
                          Auth().handleEmailSignUp(
                              emailController.text,
                              passwordController.text,
                              nameController.text,
                              lastnameController.text,
                              usernameController.text
                          ).whenComplete(() => navigateToScreen(context, LoginScreen()));
                      },
                      child: Text("Join Us")
                  ),

                  GestureDetector(
                    child: Text(
                        "Already I've an account"
                    ),
                    onTap: (){
                      navigateToScreen(context, LoginScreen());
                    },
                  ),
                ],
              ),
            ),
          )
      ),
    );

  }

  bool isPasswordMatched() {
    return passwordController.text == passwordTemporalController.text;
  }

}

bool isValidEmail(String email) {
  final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return regex.hasMatch(email);
}

void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

