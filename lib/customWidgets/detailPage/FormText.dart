import 'package:flutter/material.dart';
import 'package:mymovieslist/utils/appConfig.dart';

class FormText extends StatelessWidget {
  final String label, value;

  FormText({this.label = "Label", this.value = "Value"});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          children: [
            Flexible(
              child: Container(
                width: 100,
                child: Text(
                  label,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
