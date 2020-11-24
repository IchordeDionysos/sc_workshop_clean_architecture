import 'package:sc_clean_architecture/domain/entities/wish.dart';

abstract class WishDataSource {
  Future<List<Wish>> getWishlist();
}
