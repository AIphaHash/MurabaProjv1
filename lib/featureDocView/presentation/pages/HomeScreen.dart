import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart';
import 'package:flutter_application_5/featureDocView/domain/useCases/fetch_users.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/enterDate.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/job.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/logoBanner.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/logoutButton.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/renew.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/user_card.dart';
import 'package:flutter_application_5/generated/l10n.dart';

class Homescreen extends StatefulWidget {
  final FetchUsers fetchUsers;

  const Homescreen({Key? key, required this.fetchUsers}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<User>> usersFuture;
  bool hideContent = false;

  @override
  void initState() {
    super.initState();
    usersFuture = widget.fetchUsers.call();
  }

  // This function will show the popup with the dropdown options
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select Language'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'en');
                // Handle language selection here
                print('Selected language: en');
              },
              child: Text('English'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'ar');
                // Handle language selection here
                print('Selected language: ar');
              },
              child: Text('Arabic'),
            ),
          ],
        );
      },
    ).then((selectedValue) {
      if (selectedValue != null) {
        // Handle language selection here
        print('Selected language: $selectedValue');
      }
    });
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
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(
                  height: 30), // Space to account for the settings icon
              // CustomAppBar (Stays fixed)
              CustomAppBar(),
              // UserCard (Always visible)
              FutureBuilder<List<User>>(
                future: usersFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text(S.of(context).failed_load_data));
                  } else if (snapshot.hasData) {
                    final users = snapshot.data!;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return UserCard(user: user);
                      },
                    );
                  } else {
                    return Center(child: Text(S.of(context).failed_load_data));
                  }
                },
              ),
              // Additional Content (Toggle height)
              AnimatedContainer(
                duration: const Duration(milliseconds: 500), // Smooth animation
                height: hideContent ? 0 : 330,
                padding: const EdgeInsets.fromLTRB(
                    0, 0, 0, 0), // Adjust height dynamically
                child: Column(
                  children: [
                    Expanded(
                      child: FutureBuilder<List<User>>(
                        future: usersFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(S.of(context).failed_load_data));
                          } else if (snapshot.hasData) {
                            final users = snapshot.data!;
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                final user = users[index];
                                return RedBackground(user: user);
                              },
                            );
                          } else {
                            return const Center(
                                child: Text("No data available"));
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<User>>(
                        future: usersFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(S.of(context).failed_load_data));
                          } else if (snapshot.hasData) {
                            final users = snapshot.data!;
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                final user = users[index];
                                return BlueBackgroundWidget(user: user);
                              },
                            );
                          } else {
                            return const Center(
                                child: Text("No data available"));
                          }
                        },
                      ),
                    ),
                    job(),
                    // Optional spacing
                  ],
                ),
              ),
              // Push Button at the Bottom
              LogoutButton(),
            ],
          ),
        ),
        Positioned(
          top: 40.0, // Adjust the vertical position above CustomAppBar
          right: 280.0, // Adjust the horizontal position
          child: IconButton(
            icon: const Icon(Icons.settings,
                color: Color.fromARGB(255, 54, 54, 54), size: 30.0),
            onPressed: () {
              _showLanguageDialog(context);
            },
          ),
        ),
      ],
    );
  }
}
