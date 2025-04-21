import 'package:flutter/material.dart';
import 'package:catele/CattleOwnerScreen/intropage.dart';
// import 'auth_services.dart'; // Import the AuthService
// import 'home_screen.dart'; // Home screen after successful login/signup
// import 'package:firebase_auth/firebase_auth.dart';
class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // final _authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // final _usernameController = TextEditingController();
  bool _isLogin = true;
  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _toggleView() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _submit() async {
    // final username =_usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      // Show error if email or password is empty
      return;
    }

    // User? user;
    // if (_isLogin) {
    //   user = await _authService.signIn(email, password);
    // } else {
    //   user = await _authService.signUp(email, password);
    // }

    // if (user != null) {
    //   // Navigate to the home screen after successful login/signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroPage()),
      );
    // } else {
    //   // Show error message
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text("Error"),
    //         content: Text(_isLogin
    //             ? "Login failed. Please try again."
    //             : "Sign up failed. Please try again."),
    //         actions: [
    //           TextButton(
    //             onPressed: () => Navigator.pop(context),
    //             child: Text("OK"),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 350,
                child: TextField(

                  controller: _emailController,
                  decoration:InputDecoration(

                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: Colors.deepOrange,
                            width: 2.8
                        )
                    ),
                    label: Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),

                    ),
                    prefixIcon: Icon(Icons.email),

                  ) ,

                ),
              ),
            ),

            SizedBox(height: 10,),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: _passwordController,
                  obscureText: _isObscured,
                  obscuringCharacter: '*',

                  decoration:InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                            color: Colors.deepOrange,
                            width: 2.8
                        )
                    ),
                    label: Text('Password'),
                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(20.0)

                    ),
                    suffixIcon: IconButton(onPressed:_togglePasswordVisibility,
                        icon:Icon(_isObscured ? Icons.visibility : Icons.visibility_off,)),
                    prefixIcon: Icon(Icons.password),
                  ) ,

                ),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: _submit,
              child: Text(_isLogin ? 'Login' : 'Sign Up', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            TextButton(
              onPressed: _toggleView,
              child: Text(_isLogin
                  ? 'Don\'t have an account? Sign Up'
                  : 'Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}


// Center(
// child: Container(
// height:480,
// width: 380,
//
// decoration: BoxDecoration(
// color: Color.fromARGB(10, 255, 0, 0),
// borderRadius: BorderRadius.circular(20),
// border: Border.all(
// width: 2,
// color: Colors.black
// )
// ),
//
//
// child: Center(
// child: SingleChildScrollView(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
//
// children: [
//
// Icon(
// Icons.account_circle, size: 100,color: Colors.blue,
// ),
//
//
// Text('Login', style: TextStyle(
// fontSize: 35,
// fontWeight: FontWeight.bold,
// color: Colors.indigo
// ),),
//
//
//
// SizedBox(height: 20,),
//
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: SizedBox(
// width: 350,
// child: TextField(
//
// controller: emailText,
// decoration:InputDecoration(
//
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20.0),
// borderSide: BorderSide(
// color: Colors.deepOrange,
// width: 2.8
// )
// ),
// label: Text('Username'),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20.0),
//
// ),
// prefixIcon: Icon(Icons.face),
//
// ) ,
//
// ),
// ),
// ),// email text field
//
//
// SizedBox(height: 10,),
//
//
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: SizedBox(
// width: 350,
// child: TextField(
// controller: passwordText,
// obscureText: _isObscured,
// obscuringCharacter: '*',
//
// decoration:InputDecoration(
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20.0),
// borderSide: BorderSide(
// color: Colors.deepOrange,
// width: 2.8
// )
// ),
// label: Text('Password'),
// border: OutlineInputBorder(
//
// borderRadius: BorderRadius.circular(20.0)
//
// ),
// suffixIcon: IconButton(onPressed:_togglePasswordVisibility,
// icon:Icon(_isObscured ? Icons.visibility : Icons.visibility_off,)),
// prefixIcon: Icon(Icons.password),
// ) ,
//
// ),
// ),
// ),//password text field
//
//
// SizedBox(height: 20,),
//
//
//
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor: Colors.red,
// foregroundColor: Colors.white,
// ),
//
// onPressed: _login,
//
// child: Text('Login' , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)), // login button
//
//
//
// SizedBox(
// height: 20,
// ),
//
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text("don't have an account?"),
// SizedBox(width: 10,),
//
//
//
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor: Colors.red,
// foregroundColor: Colors.white,
// ),
//
// onPressed: () async{
//
//
// var sharedPref = await SharedPreferences.getInstance();
// sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
//
//
// Navigator.push(
// context,
// MaterialPageRoute(
// builder:(context) =>Signup(),
// ));
// },
// child: Text('Signup' , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
//
// ],
// )
//
// ],
// ),
// ),
// ),
// ),
// )
