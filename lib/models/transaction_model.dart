import 'package:equatable/equatable.dart';
import 'package:travel/models/destination_model.dart';

class TransactionModel extends Equatable {
  final DestinationModel destination;
  final String id;
  final int amoutOfTraveler;
  final String selectedSeat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel({
    this.id = '',
    required this.destination,
    this.amoutOfTraveler = 0,
    this.selectedSeat = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        destination: DestinationModel.fromJson(
          json['destinations']['id'],
          json['destination'],
        ),
        id: id,
        amoutOfTraveler: json['amountOfTraveler'],
        selectedSeat: json['selectedSeat'],
        insurance: json['insurance'],
        refundable: json['refundable'],
        vat: json['vat'],
        price: json['price'],
        grandTotal: json['grandTotal'],
      );

  @override
  List<Object?> get props => [
        destination,
        amoutOfTraveler,
        selectedSeat,
        insurance,
        refundable,
        vat,
        price,
        grandTotal,
      ];
}
