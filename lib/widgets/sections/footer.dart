import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/my_constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentYear = DateFormat('y').format(DateTime.now());
    return Container(
      height: 100,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          '${MyConstants.of(context)!.myNameSurname} - $currentYear',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
