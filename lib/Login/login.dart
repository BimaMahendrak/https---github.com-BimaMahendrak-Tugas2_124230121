import 'package:flutter/material.dart';
import '../View/homepage.dart';
import '../Layout/layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  String notifikasi = '';
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: "Login Page",
      showBottomNavigation: false,
      showBackButton: false,
      appBarBackgroundColor: const Color.fromARGB(255, 119, 119, 119),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Selamat Datang",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _username,
                        decoration: InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_username.text == 'admin' && _password.text == 'admin') {
                                notifikasi = 'Login Berhasil';
                                isLoginSuccess = true;
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Homepage(username: _username.text),
                                  ),
                                );
                              } else {
                                notifikasi = 'Login gagal';
                                isLoginSuccess = false;
                              }

                              if (!isLoginSuccess) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(notifikasi),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
