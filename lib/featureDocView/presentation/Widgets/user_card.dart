import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart'; // Import your CustomAppBar file

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110, // Set the desired height for the background
      child: Card(
        color: Colors.white, // Set the background color to white
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical:
                                  0.0), // Add padding inside the container
                          decoration: BoxDecoration(
                            color: Colors.green, // Background color
                            borderRadius:
                                BorderRadius.circular(6), // Border radius
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                user.status, // Replace with your desired text
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Text color
                                ),
                              ),
                              const SizedBox(
                                  width: 4), // Space between text and dot
                              Icon(
                                Icons.circle,
                                size: 12, // Size of the dot
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
                              fontSize: 16,
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
                    GestureDetector(
                      onTap: () {
                        // Display the full name using a tooltip or snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(user.fullName),
                            duration: Duration(
                                seconds:
                                    2), // Display the message for 2 seconds
                          ),
                        );
                      },
                      child: Text(
                        user.fullName.length > 35
                            ? '${user.fullName.substring(0, 34)}..'
                            : user.fullName,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow
                            .ellipsis, // Ensures ellipses for long text
                        maxLines: 1, // Limits the text to a single line
                      ),
                    ),
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
                    width: 75, // Adjust the width as needed
                    height: 120, // Adjust the height as needed
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
