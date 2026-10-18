abstract final class PriceFormatter {
  static String usd(int cents) {
    final int dollars = cents ~/ 100;
    final String whole = dollars.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (_) => ',',
    );
    return '\$$whole';
  }
}
