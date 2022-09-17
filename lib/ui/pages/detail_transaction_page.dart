import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel/shared/arguments.dart';
import '../../cubit/auth_cubit.dart';
import '../../shared/theme.dart';
import '../widget/booking_details_item.dart';

class DetailTransactionPage extends StatelessWidget {
  const DetailTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var showDetailTransaction =
        ModalRoute.of(context)!.settings.arguments as DetailTransaction;

    Widget bookingDetails() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Note: Destination Tile
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(showDetailTransaction.imageUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        showDetailTransaction.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        showDetailTransaction.city,
                        style: greyTextStyle.copyWith(
                          fontWeight: ligth,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'),
                        ),
                      ),
                    ),
                    Text(
                      showDetailTransaction.rating.toString(),
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Note: Booking Details
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Booking Details',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
            // Note: Details Items
            BookingDetailsItem(
              title: 'Traveler',
              textValue: '${showDetailTransaction.amountOfTraveler} Person',
              colorValue: kBlackColor,
            ),
            BookingDetailsItem(
              title: 'Seat',
              textValue: showDetailTransaction.selectedSeat,
              colorValue: kBlackColor,
            ),
            BookingDetailsItem(
              title: 'Insurance',
              textValue: showDetailTransaction.insurance ? 'YES' : 'NO',
              colorValue:
                  showDetailTransaction.insurance ? kGreenColor : kRedColor,
            ),
            BookingDetailsItem(
              title: 'Refundable',
              textValue: showDetailTransaction.refundable ? 'YES' : 'NO',
              colorValue:
                  showDetailTransaction.refundable ? kGreenColor : kRedColor,
            ),
            BookingDetailsItem(
              title: 'VAT',
              textValue:
                  '${(showDetailTransaction.vat * 100).toStringAsFixed(0)}%',
              colorValue: kBlackColor,
            ),
            BookingDetailsItem(
              title: 'Price',
              textValue: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(showDetailTransaction.price),
              colorValue: kBlackColor,
            ),
            BookingDetailsItem(
              title: 'Grand Total',
              textValue: NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(showDetailTransaction.grandTotal),
              colorValue: kPrimaryColor,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Column(
        children: [
          bookingDetails(),
        ],
      ),
    );
  }
}
