import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/LoginCard.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/dropDown/lanuguageDD.dart';
import 'package:flutter_application_5/featureDocView/presentation/Widgets/logoBanner.dart';
import 'package:flutter_application_5/featureDocView/presentation/provider/language.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            'assets/images/Assets.png', // Path to the background image
            fit: BoxFit.cover, // Make the image cover the entire screen
          ),
        ),
        // Scaffold with Transparent Background
        Scaffold(
          backgroundColor: Colors.transparent, // Ensure scaffold is transparent
          body: SingleChildScrollView(
            // Add this to make the body scrollable
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo Banner'
                  SizedBox(
                    height: 40,
                  ),
                  Stack(
                    children: [
                      // Custom AppBar (Logo Banner)
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: CustomAppBar(),
                      ),

                      // Language Dropdown (Positioned at the top-left corner)
                      Consumer<Language>(builder: (context, language, child) {
                        return Positioned(
                          top:
                              15.0, // Adjust the vertical position above CustomAppBar
                          right: 340.0, // Adjust the horizontal position
                          child: LanguageDropdown(
                              onLanguageChanged: (String newLang) {
                            language.languageChange(languag: newLang);
                          }),
                        );
                      }),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.all(0),
                    child: SizedBox(
                      height: 0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomLogin(), // CustomLoginWidget for login form
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
