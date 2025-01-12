import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/domain/entites/user.dart';

class DocProfileBox extends StatelessWidget {
  final User user;

  const DocProfileBox({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.network(
            'https://devdmisapi.muraba.dev/${user.pfp}',
            width: 80, // Adjust the width as needed
            height: 100, // Adjust the height as needed
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error,
                  size: 80); // Fallback if the image fails to load
            },
          ),
        ],
      ),
    );
  }
}
