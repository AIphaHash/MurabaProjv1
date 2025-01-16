import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/data/datasource/user_remote_data_source.dart';
import 'package:flutter_application_5/featureDocView/data/repository/user_repository_impl.dart';
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart';
import 'package:flutter_application_5/featureDocView/domain/useCases/fetch_users.dart';
import 'package:flutter_application_5/featureDocView/presentation/pages/HomeScreen.dart';
import 'package:flutter_application_5/featureDocView/presentation/pages/d';
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
  String _response = ''; // To display the response

  late final AuthService _authService;
  late final FetchUsers fetchUsers;

  @override
  void initState() {
    super.initState();
    _authService = AuthService(); // Initialize AuthService with context

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
      String responseMessage = await _authService.loginAndGetCookies(
        _usernameController.text,
        _passwordController.text,
      );

      setState(() {
        _response = responseMessage;
      });

      // Navigate to another page upon successful login
      if (responseMessage == 'Login Successful') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homescreen(fetchUsers: fetchUsers),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _response = e.toString();
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
            TextField(
              controller: _usernameController,
              style: inputTextStyle,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: inputTextStyle,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
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
