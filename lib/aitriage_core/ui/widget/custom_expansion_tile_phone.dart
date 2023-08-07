import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExpansionTilePhone extends StatelessWidget {
  const CustomExpansionTilePhone({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          Icon(Icons.supervised_user_circle),
          SizedBox(width: 5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Patient001'),
              Text('05 Oct 2001, 11:39 am')
            ],
          )
        ],
      ),
      children: [
        Row(
          children: [
            Text('Gender'),
            Spacer(),
            Text('Female')
          ],
        ),
        Row(
          children: [
            Text('Age'),
            Spacer(),
            Text('12-07-1993(32y1m')
          ],
        ),
        Row(
          children: [
            Text('Race'),
            Spacer(),
            Text('Chinese')
          ],
        ),
      ],
    );
  }
}
