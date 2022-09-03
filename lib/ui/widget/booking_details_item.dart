import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class BookingDetailsItem extends StatelessWidget {
  final String title;
  final String textValue;
  final Color colorValue;

  const BookingDetailsItem({
    Key? key,
    required this.title,
    required this.textValue,
    required this.colorValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Text(title, style: blackTextStyle),
          Spacer(),
          Text(
            textValue,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              color: colorValue,
            ),
          ),
        ],
      ),
    );
  }
}
