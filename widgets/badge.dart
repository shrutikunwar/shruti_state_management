import 'package:flutter/material.dart';

// Defining a BadgeContainer widget which is stateless
class BadgeContainer extends StatelessWidget {
  // Defining properties for the badge
  final Widget child;
  final String value;
  final Color color;

  // Constructor for initializing badge properties
  const BadgeContainer({
    Key? key,
    required this.child,
    required this.value,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Displaying the child widget
        child,
        // Positioning the badge
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color,
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            // Displaying the value inside the badge
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
