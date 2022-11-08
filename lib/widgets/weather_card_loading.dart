import 'package:flutter/material.dart';

class WeatherCardLoading extends StatelessWidget {
  const WeatherCardLoading({
    Key? key,
    this.errorMessage,
  }) : super(key: key);
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Card(
        color: Colors.white.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: errorMessage == null
              ? const CircularProgressIndicator()
              : Text(
                  errorMessage!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
        ),
      ),
    );
  }
}
