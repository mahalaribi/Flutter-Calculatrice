import 'package:flutter/material.dart';
import 'package:flutter_new_revision/calculetrice/calculatrice.dart';

void main()
{
  return runApp(calculatrice());
}
class calculatrice extends StatelessWidget {
  const calculatrice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: calc(),
    );
  }
}