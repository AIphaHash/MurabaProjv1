import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/data/datasource/user_remote_data_source.dart';
import 'package:flutter_application_5/featureDocView/data/repository/user_repository_impl.dart';
import 'package:flutter_application_5/featureDocView/domain/useCases/fetch_users.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/Buttons/Login.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/Buttons/forgotPass.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/textboxs/emailbox.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/textboxs/password.dart';
import 'package:flutter_application_5/featureDocView/presentation/pages/HomeScreen.dart';

import 'package:http/http.dart' as http;

class CustomLogin extends StatefulWidget {
  final double height;

  const CustomLogin({Key? key, this.height = 50.0}) : super(key: key);

  @override
  _CustomLoginState createState() => _CustomLoginState();
}

class _CustomLoginState extends State<CustomLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _response = ''; // To display the response (use String instead of void)

  late final AuthService _authService;
  late final FetchUsers fetchUsers;

  @override
  void initState() {
    super.initState();
    _authService = AuthService(); // Initialize AuthService

    // Initialize the final variables
    final httpClient = http.Client();
    final remoteDataSource = UserRemoteDataSource(client: httpClient);
    final userRepository =
        UserRepositoryImpl(remoteDataSource: remoteDataSource);
    fetchUsers = FetchUsers(userRepository);
  }

  // Function to handle login
  Future<void> _login() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _response = 'Username and password cannot be empty.';
      });
      return;
    }

    try {
      // Call the login function, without expecting a response
      await _authService.loginAndGetCookies(
        _usernameController.text,
        _passwordController.text,
      );

      // Assuming login success; you can display a success message or handle login-specific logic here
      setState(() {
        _response = 'Login successful!'; // Modify this message as needed
      });

      // Navigate to another page upon successful login
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Homescreen(fetchUsers: fetchUsers),
        ),
      );
    } catch (e) {
      setState(() {
        _response = e.toString(); // Display error message if login fails
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle inputTextStyle = TextStyle(fontSize: 16.0, color: Colors.black);

    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Add the first image (Renew.png)
            Image.asset(
              'assets/images/Renew.png',
              height: 130,
              // Adjust height as needed
            ),
            const SizedBox(height: 10),
            // Add the second image (Registration.png)
            Image.asset(
              'assets/images/registration.png',
              height: 130, // Adjust height as needed
            ),
            const SizedBox(height: 12.0),
            Text(
              "------------------------أو------------------------",
              style: const TextStyle(color: Color.fromARGB(255, 88, 88, 88)),
            ),
            SizedBox(height: 10),
            // Emailbox and other widgets
            Emailbox(controller: _usernameController, hintText: "username"),
            const SizedBox(height: 12.0),
            PasswordBox(controller: _passwordController, hintText: "password"),
            const SizedBox(height: 5.0),
            Forgotpass(text: "forgot the password?", onPressed: () {}),
            const SizedBox(height: 5.0),

            Login(onPressed: _login, text: "login"),
            if (_response.isNotEmpty)
              Text(
                _response,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
