import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart';
import 'package:flutter_application_5/featureDocView/domain/useCases/fetch_users.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/enterDate.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/job.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/logoBanner.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/renew.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/user_card.dart';

class Homescreen extends StatefulWidget {
  final FetchUsers fetchUsers;

  const Homescreen({Key? key, required this.fetchUsers}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<User>> usersFuture;
  bool hideContent = false; // Tracks whether the content should shrink

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
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 30),
              // CustomAppBar (Stays fixed)
              CustomAppBar(),
              // UserCard (Always visible)
              FutureBuilder<List<User>>(
                future: usersFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Failed to load data"));
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
                    return const Center(child: Text("No data available"));
                  }
                },
              ),

              // Additional Content (Toggle height)
              AnimatedContainer(
                duration: const Duration(milliseconds: 500), // Smooth animation
                height: hideContent ? 0 : 370,
                padding: EdgeInsets.fromLTRB(
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
                            return const Center(
                                child: Text("Failed to load data"));
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
                    Expanded(
                      child: FutureBuilder<List<User>>(
                        future: usersFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return const Center(
                                child: Text("Failed to load data"));
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
                    job(),
                    // Optional spacing
                  ],
                ),
              ),

              // Push Button at the Bottom
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      hideContent = !hideContent; // Toggle height
                    });
                  },
                  child:
                      Text(hideContent ? "Restore Content" : "Shrink Content"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
