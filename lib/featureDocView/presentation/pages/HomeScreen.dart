// presentation/pages/homescreen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart';
import 'package:flutter_application_5/featureDocView/domain/useCases/fetch_users.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/DocProfileBox.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/logoBanner.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/user_card.dart';

class Homescreen extends StatefulWidget {
  final FetchUsers fetchUsers;

  const Homescreen({Key? key, required this.fetchUsers}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<User>> usersFuture;

  @override
  void initState() {
    super.initState();
    usersFuture = widget.fetchUsers.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Use the CustomAppBar widget here
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16), // Add space between app bar and content
          DocProfileBox(), // Add the DocProfileBox widget here
          SizedBox(height: 16), // Add space between profile box and user list
          Expanded(
            child: FutureBuilder<List<User>>(
              future: usersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Failed to load data"));
                } else if (snapshot.hasData) {
                  final users = snapshot.data!;
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return UserCard(user: user);
                    },
                  );
                } else {
                  return Center(child: Text("No data available"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
