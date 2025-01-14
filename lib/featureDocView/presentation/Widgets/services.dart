import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 420.0,
            height: 135, // Set the desired height
            decoration: BoxDecoration(
              color:
                  const Color.fromARGB(255, 255, 250, 238), // Background color
              borderRadius: BorderRadius.circular(16.0), // Corner radius
            ),
            padding: EdgeInsets.all(16.0), // Padding inside the container
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.local_hospital, // Hospital icon
                      color: Colors.blue, // Icon color
                      size: 30.0, // Icon size
                    ),
                    const SizedBox(width: 8), // Space between icon and text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'عيادة',
                          style: TextStyle(
                            color: Colors.blue, // Text color
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'يمتلك',
                          style: TextStyle(
                            color: Colors.blue, // Text color
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16), // Space between columns
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'العنوان',
                          style: TextStyle(
                            color: Colors.blue, // Text color
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'بغداد . بلديات',
                          style: TextStyle(
                            color: Colors.blue, // Text color
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'وقت عمل العيادة',
                          style: TextStyle(
                            color: Colors.blue, // Text color
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'صباحي و مسائي',
                          style: TextStyle(
                            color: Colors.blue, // Text color
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 1, // Width of the line
                  height: 100, // Height of the line
                  color: Colors.blue, // Color of the line
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'رقم الامر النقابي',
                      style: TextStyle(
                        color: Colors.blue, // Text color
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '423132',
                      style: TextStyle(
                        color: Colors.blue, // Text color
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'منطقة التفتيش',
                      style: TextStyle(
                        color: Colors.blue, // Text color
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'الكرخ',
                      style: TextStyle(
                        color: Colors.blue, // Text color
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 8, // Adjust the position of the button
            child: ElevatedButton(
              onPressed: () {
                // Define the action for the button
                print('Button Pressed!');
              },
              child: Text('اضغط هنا'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
