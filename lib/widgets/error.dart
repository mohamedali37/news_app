import 'package:flutter/material.dart';

class ErrorMsg extends StatelessWidget {
  const ErrorMsg({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text(
          error,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
