import 'package:flutter/material.dart';
import 'package:flutter_application_5/generated/l10n.dart';

class customLogin extends StatelessWidget {
  final double height; // Height property for input boxes

  const customLogin({Key? key, this.height = 50.0})
      : super(key: key); // Default height is 50.0

  @override
  Widget build(BuildContext context) {
    // TextStyles
    TextStyle inputTextStyle = TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    );

    TextStyle buttonTextStyle = TextStyle(
      fontSize: 16.0,
      color: Colors.white,
    );

    TextStyle forgotPasswordTextStyle = TextStyle(
      fontSize: 14.0,
      color: Colors.blue,
      decoration: TextDecoration.underline, // Adds underline to the text
    );

    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0), // Padding inside the container
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: const Offset(0, 4), // Shadow position
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.9, // Responsive width
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Two Pictures - Stacked Vertically
            Column(
              children: [
                Container(
                  height: 130, // Fixed height of 150
                  width: 300, // Fixed width of 300
                  color: Colors.transparent, // Removed gray background color
                  child: Image.asset(
                    'assets/images/registration.png', // First image from assets
                    fit: BoxFit
                        .fill, // Fill the container, maintaining the given size
                  ),
                ),
                const SizedBox(height: 16.0), // Spacing
                Container(
                  height: 130, // Fixed height of 150
                  width: 300, // Fixed width of 300
                  color: Colors.transparent, // Removed gray background color
                  child: Image.asset(
                    'assets/images/Renew.png', // Second image from assets
                    fit: BoxFit
                        .fill, // Fill the container, maintaining the given size
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0), // Spacing

            // Separator Text
            const Text(
              '------------------------- or -------------------------',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0), // Spacing

            // Input Boxes for Username and Password
            TextField(
              style: inputTextStyle, // Style for the input text
              decoration: InputDecoration(
                hintText: S.of(context).usernameInput, // Placeholder text
                hintStyle: TextStyle(
                  color: Colors.grey, // Color for the hint text
                  fontSize: 16.0, // Font size for the hint text
                  fontWeight: FontWeight.w400, // Font weight for the hint text
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical:
                      height / 4, // Adjust the vertical padding based on height
                  horizontal: 12.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 12.0), // Spacing
            TextField(
              style: inputTextStyle, // Apply the custom TextStyle here
              decoration: InputDecoration(
                hintText: 'Password',
                contentPadding: EdgeInsets.symmetric(
                  vertical: height /
                      20, // Adjust the vertical padding based on height
                  horizontal: 12.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
              obscureText: true, // Hide password input
            ),

            // Forgot Password Text
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle forgot password action
                },
                child: Text(
                  'Forgot Password?',
                  style:
                      forgotPasswordTextStyle, // Apply the custom TextStyle here
                ),
              ),
            ),

            // Button
            ElevatedButton(
              onPressed: () {
                // Handle button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: Text(
                'Login',
                style: buttonTextStyle, // Apply the custom TextStyle here
              ),
            ),
          ],
        ),
      ),
    );
  }
}
