class DetailTransaction {
  final String email;
  final int amountOfTraveler;
  final String selectedSeat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;
  final String name;
  final String city;
  final String imageUrl;
  final double rating;

  DetailTransaction({
    this.email = '',
    this.amountOfTraveler = 0,
    this.selectedSeat = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
    this.name = '',
    this.city = '',
    this.imageUrl = '',
    this.rating = 0,
  });
}
