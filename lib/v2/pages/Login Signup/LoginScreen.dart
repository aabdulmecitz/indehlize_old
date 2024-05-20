import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indehlizi/Auth.dart';
import 'package:indehlizi/screens/MainScreen.dart';
import '../Login Register 2/RegisterScreen2.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  late String password;
  late String email;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                        height: 100,
                        child:
                        Image.asset("images/logos/mainlogo.png")
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
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
                          return "Enter your email";
                        }else{
                          if (!isValidEmail(value)) {
                            return 'Please enter an email';
                          } else {
                            email = value;
                            return null;
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      obscureText: true,
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
                      onSaved: (value){
                        password = value!;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Text(
                            "Forgot My Password"
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _goToRegisterScreenButton()
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _loginButton(),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }

  Widget _loginButton() => ElevatedButton(
      onPressed: (){
        setState(() {
          if (_formKey.currentState!.validate()){
            _formKey.currentState?.save();
            debugPrint("email = $email , password = $password");
            Auth().signInWhithEmailAndPassword(email, password).whenComplete(() =>
            {
              print('Entering is succeed'),
              Navigator.pushReplacement(context, MainScreen() as Route<Object?>),
            ChangeNotifier()
            }
            ).onError((error, stackTrace)
            {
              Fluttertoast.showToast(
                  msg: error.toString(),
                  toastLength: Toast.LENGTH_LONG,
                  textColor: Colors.red,
                  gravity: ToastGravity.TOP,
                  backgroundColor: Colors.deepPurple
              );
            });

            //Go to main screen
          }
        });

      },
      child: Text(
        "Login"
      )
  );

  Widget _goToRegisterScreenButton() => InkWell(
      onTap:() {navigateToScreen(context, RegisterScreen());},
      child: Text('Create Account')
  );

}

bool isValidEmail(String email) {
  final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return regex.hasMatch(email);
}

void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}
