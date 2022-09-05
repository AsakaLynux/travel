import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/page_cubit.dart';
import 'package:travel/ui/pages/home_page.dart';
import 'package:travel/ui/pages/transaction_page.dart';
import 'package:travel/ui/pages/wallet_page.dart';
import 'package:travel/ui/widget/custom_bottom_navigation_item.dart';
import 'package:travel/ui/widget/setting_page.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();

        case 1:
          return TransactionPage();

        case 2:
          return WalletPage();

        case 3:
          return SettingPage();

        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 30,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                iconUrl: 'icon_home.png',
                index: 0,
              ),
              CustomBottomNavigationItem(
                iconUrl: 'icon_booking.png',
                index: 1,
              ),
              CustomBottomNavigationItem(
                iconUrl: 'icon_card.png',
                index: 2,
              ),
              CustomBottomNavigationItem(
                iconUrl: 'icon_setting.png',
                index: 3,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kbackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
