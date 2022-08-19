import 'package:flutter/material.dart';
import 'package:travel/ui/widget/destination_card.dart';
import 'package:travel/ui/widget/destination_tile.dart';
import '../../shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Howdy,\nKezia Anne',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Where to fly today?',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: ligth,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/image_profile.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget popularDestination() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DestinationCard(
                name: 'Lake Ciliwung',
                city: 'Tangerang',
                imageUrl: 'assets/image_destination_1.png',
                rating: 4.8,
              ),
              DestinationCard(
                name: 'White Houses',
                city: 'Spain',
                imageUrl: 'assets/image_destination_2.png',
                rating: 4.7,
              ),
              DestinationCard(
                name: 'Hill Heyo',
                city: 'Monaco',
                imageUrl: 'assets/image_destination_3.png',
                rating: 4.8,
              ),
              DestinationCard(
                name: 'Menarra',
                city: 'Japan',
                imageUrl: 'assets/image_destination_4.png',
                rating: 5.0,
              ),
              DestinationCard(
                name: 'Payung Teduh',
                city: 'Singapore',
                imageUrl: 'assets/image_destination_5.png',
                rating: 4.8,
              ),
            ],
          ),
        ),
      );
    }

    Widget newDestinations() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            DestinationTile()
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        popularDestination(),
        newDestinations(),
      ],
    );
  }
}
