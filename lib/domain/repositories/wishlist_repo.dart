import 'package:sc_clean_architecture/domain/entities/wish.dart';

/// Repo for a wish list.
abstract class WishlistRepo {
  /// Returns a wishlist as a future.
  Future<List<Wish>> getWishlist();
}
