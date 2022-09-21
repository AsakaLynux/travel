import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel/shared/arguments.dart';
import 'package:travel/ui/pages/detail_transaction_page.dart';
import '../../models/transaction_model.dart';
import '../../shared/theme.dart';
import 'booking_details_item.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/detail-transaction',
            arguments: DetailTransaction(
              email: transaction.email,
              amountOfTraveler: transaction.amountOfTraveler,
              insurance: transaction.insurance,
              refundable: transaction.refundable,
              grandTotal: transaction.grandTotal,
              price: transaction.price,
              vat: transaction.vat,
              selectedSeat: transaction.selectedSeat,
              name: transaction.destination.name,
              imageUrl: transaction.destination.imageUrl,
              rating: transaction.destination.rating,
              city: transaction.destination.city,
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            // bottom: 15,
            top: 15,
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
                        image: NetworkImage(transaction.destination.imageUrl),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.destination.name,
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          transaction.destination.city,
                          style: greyTextStyle.copyWith(
                            fontWeight: ligth,
                          ),
                        ),
                        Text(
                          transaction.email,
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
                        transaction.destination.rating.toString(),
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Note: Booking Details
              // Container(
              //   margin: EdgeInsets.only(top: 20),
              //   child: Text(
              //     'Booking Details',
              //     style: blackTextStyle.copyWith(
              //       fontSize: 16,
              //       fontWeight: semiBold,
              //     ),
              //   ),
              // ),
              // // Note: Details Items
              BookingDetailsItem(
                title: 'Traveler',
                textValue: '${transaction.amountOfTraveler} Person',
                colorValue: kBlackColor,
              ),
              // BookingDetailsItem(
              //   title: 'Seat',
              //   textValue: transaction.selectedSeat,
              //   colorValue: kBlackColor,
              // ),
              // BookingDetailsItem(
              //   title: 'Insurance',
              //   textValue: transaction.insurance ? 'YES' : 'NO',
              //   colorValue: transaction.insurance ? kGreenColor : kRedColor,
              // ),
              // BookingDetailsItem(
              //   title: 'Refundable',
              //   textValue: transaction.refundable ? 'YES' : 'NO',
              //   colorValue: transaction.refundable ? kGreenColor : kRedColor,
              // ),

              BookingDetailsItem(
                title: 'Grand Total',
                textValue: NumberFormat.currency(
                  locale: 'id',
                  symbol: 'IDR ',
                  decimalDigits: 0,
                ).format(transaction.grandTotal),
                colorValue: kPrimaryColor,
              ),
            ],
          ),
        ),
      );
    }
  }
}
