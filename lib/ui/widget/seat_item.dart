import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  // Note:
  /*
  0. Available
  1. Selected
  2. Unavalaible 
  */

  final int status;

  const SeatItem({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backGroundColor() {
      switch (status) {
        case 0:
          return kAvalaibleColor;

        case 1:
          return kPrimaryColor;

        case 2:
          return kUnavalaibleColor;

        default:
          return kUnavalaibleColor;
      }
    }

    borderColor() {
      switch (status) {
        case 0:
          return kPrimaryColor;

        case 1:
          return kPrimaryColor;

        case 2:
          return kUnavalaibleColor;

        default:
          return kUnavalaibleColor;
      }
    }

    child() {
      switch (status) {
        case 0:
          return SizedBox();

        case 1:
          return Center(
            child: Text(
              'YOU',
              style: whiteTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          );

        case 2:
          return SizedBox();

        default:
          return SizedBox();
      }
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: backGroundColor(),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor(),
        ),
      ),
      child: child(),
    );
  }
}
