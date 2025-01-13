import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart'; // Import your CustomAppBar file

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170, // Set the desired height for the background
      child: Card(
        color: Colors.white, // Set the background color to white
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical:
                                  4.0), // Add padding inside the container
                          decoration: BoxDecoration(
                            color: Colors.green, // Background color
                            borderRadius:
                                BorderRadius.circular(15.0), // Border radius
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                user.status, // Replace with your desired text
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Text color
                                ),
                              ),
                              const SizedBox(
                                  width: 4), // Space between text and dot
                              Icon(
                                Icons.circle,
                                size: 8, // Size of the dot
                                color: Colors.white, // Color of the dot
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${user.id.toString()}#',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 17, 91, 152),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        user.arFullname,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Schyler'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      user.fullName,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        user.profisinaloti,
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10), // Space between text and image
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://devdmisapi.muraba.dev/${user.pfp}',
                    width: 90, // Adjust the width as needed
                    height: 100, // Adjust the height as needed
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error,
                          size: 80); // Fallback if the image fails to load
                    },
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
