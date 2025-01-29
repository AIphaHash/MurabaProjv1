import 'package:flutter/material.dart';
import 'package:flutter_application_5/featureDocView/presentation/provider/changePFP.dart';
import 'package:provider/provider.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Confirm'),
      ),
    );
  }
}
