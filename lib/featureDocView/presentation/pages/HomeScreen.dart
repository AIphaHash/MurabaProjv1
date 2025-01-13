import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart';
import 'package:flutter_application_5/featureDocView/domain/useCases/fetch_users.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/address.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/logoBanner.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/job.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/renew.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/enterDate.dart';
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
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            'assets/images/Assets.png', // Path to your background image in assets
            fit: BoxFit.cover, // Make the image cover the entire screen
          ),
        ),
        // Scaffold with AppBar and Content
        Scaffold(
          backgroundColor: Colors
              .transparent, // Make Scaffold transparent to show background
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                CustomAppBar(),
                // Add space between app bar and content
                // Add space between profile box and user list
                FutureBuilder<List<User>>(
                  future: usersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Failed to load data"));
                    } else if (snapshot.hasData) {
                      final users = snapshot.data!;
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
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
                SizedBox(height: 10),
                FutureBuilder<List<User>>(
                  future: usersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Failed to load data"));
                    } else if (snapshot.hasData) {
                      final users = snapshot.data!;
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return BlueBackgroundWidget(user: user);
                        },
                      );
                    } else {
                      return Center(child: Text("No data available"));
                    }
                  },
                ),
                SizedBox(height: 10),
                FutureBuilder<List<User>>(
                  future: usersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Failed to load data"));
                    } else if (snapshot.hasData) {
                      final users = snapshot.data!;
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return RedBackground(user: user);
                        },
                      );
                    } else {
                      return Center(child: Text("No data available"));
                    }
                  },
                ),
                SizedBox(height: 10),
                Address(),
                SizedBox(height: 10),
                job()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
