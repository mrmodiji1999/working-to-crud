import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkul1/bloc/flutter_bloc.dart';
import 'package:webkul1/bloc/flutter_event.dart';
import 'package:webkul1/ui/homepage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  Map<String ,dynamic>datamodel={};
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .39,
                decoration: const BoxDecoration(color: Colors.blue),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              )
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * .14,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .076),
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(32)),
                child: Form(
        key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            16,
                            MediaQuery.of(context).size.height * .04,
                            16,
                            MediaQuery.of(context).size.height * .02),
                        child: Text(
                          'Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Text(
                          'You can signin your account by using this',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: MediaQuery.of(context).size.height * .02),
                        child: TextFormField( validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // Regular expression for email validation
                bool isValidEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
                if (!isValidEmail) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                 datamodel ['email'] = value;
                });
              }
                       ,   decoration: InputDecoration(
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                              labelText: 'Email',
                              suffixIcon: Icon(Icons.email)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: MediaQuery.of(context).size.height * .02),
                        child: TextFormField(  controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                 datamodel ['password'] = value;
                });
              },
                          decoration: InputDecoration(
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                              labelText: 'Password',
                              suffixIcon: Icon(Icons.remove_red_eye)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: MediaQuery.of(context).size.height * .02),
                        child: TextFormField( obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                 datamodel ['confirmPassword'] = value;
                });
              },
                          decoration: InputDecoration(
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                              labelText: 'Confrim Password',
                              suffixIcon: Icon(Icons.remove_red_eye)),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: MediaQuery.of(context).size.height * .04),
                          child: InkWell( onTap: () {
                if (_formKey.currentState!.validate()) {
               print('Confirm Password: $datamodel');
               context.read<FlutterBloc>().add(userLoginEvent(model: datamodel));
                }
              },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .08,
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Center(
                                  child: Text(
                                'Sign in',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                              )),
                            ),
                          ))
                    ],
                  ),
                ),
              )),
          Positioned(
              right: MediaQuery.of(context).size.height * .12,
              bottom: MediaQuery.of(context).size.height * .09,
              child: Row(
                children: [
                  Text('Allredy have account ?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostDataPage()));
                      },
                      child: Text('LogIn'))
                ],
              ))
        ],
      ),
    );
  }
}
