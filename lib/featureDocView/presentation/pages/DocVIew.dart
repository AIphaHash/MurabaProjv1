import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/logoBanner.dart'; // Import your CustomAppBar file

class YourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Use the custom app bar here
    );
  }
}
