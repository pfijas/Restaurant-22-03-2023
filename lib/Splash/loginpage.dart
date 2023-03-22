import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restuarant/Splash/Profilepage.dart';
import 'package:restuarant/splash/signup.dart';
import 'HomePage.dart';

class LoginDemo extends StatefulWidget {
  @override
  State<LoginDemo> createState() => _LoginDemoState();

}
class _LoginDemoState extends State<LoginDemo> {
  final _loginFormKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var email, password;
   bool _obscureText  =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
        title: Text(
          "Login",
          style: GoogleFonts.notoSerifLao(),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 200,
          ),
          Form(
            key: _loginFormKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      makeInputEmail(label: "Email"),
                      makeInputPassword(label: "Password", obsureText: true,),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(40)),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 100,
                    onPressed: () {
                      if (_loginFormKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    color: Colors.deepOrange,
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20)
                    // ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Create Account? ",
                      ),
                      WidgetSpan(
                          child: InkWell(
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                        onTap: () => setState(() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignupPage()));
                        }),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //Test form field for email

  Widget makeInputEmail({label, obsureText = false}) {
    var emailController;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: emailController,
          validator: (value) {
            if (value!.isEmpty ||
                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return "Enter Correct Email Address";
            } else {
              return null;
            }
          },
          obscureText: obsureText,
          decoration: const InputDecoration(
            hintText: "Enter valid email id",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

//Text form field for password

  Widget makeInputPassword({label, obsureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(

          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: passwordController,
          validator: (value) {
            if (value!.isEmpty || value == null) {
              return "Field is empty";
            }
            if (!RegExp(
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,10}$')
                .hasMatch(value)) {
              return "Uppercase, lowercase, numbers";
            } else {
              return null;
            }
          },
          obscureText: _obscureText,
          maxLength: 10,
           decoration:  InputDecoration(
    suffixIcon: GestureDetector(
    onTap: () {
    setState(() {
    _obscureText = !_obscureText;
    });
    },
    child: Icon(
    _obscureText ? Icons.visibility : Icons.visibility_off,
    semanticLabel:
    _obscureText ? 'show password' : 'hide password',
    ),
    ),

    hintText: "Enter a strong password",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
 }