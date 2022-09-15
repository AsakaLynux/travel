import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/seat_cubit.dart';

import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  // Note:
  /*
  0. Available
  1. Selected
  2. Unavalaible 
  */

  final String id;
  final bool isAvailable;

  const SeatItem({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backGroundColor() {
      if (!isAvailable) {
        return kUnavalaibleColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvalaibleColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnavalaibleColor;
      } else {
        return kPrimaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
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
      ),
    );
  }
}
