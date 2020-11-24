import 'package:sc_clean_architecture/data/data_sources/wish_data_source.dart';
import 'package:sc_clean_architecture/data/repositories/wishlist_repo.dart';
import 'package:sc_clean_architecture/domain/entities/wish.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockWishDataSource extends Mock implements WishDataSource {}

void main() {
  MockWishDataSource mockWishDataSource;
  WishlistRepoImpl repo;

  setUp(() {
    mockWishDataSource = MockWishDataSource();
    repo = WishlistRepoImpl(mockWishDataSource);
  });

  test('test wishlist repo impl', () {
    when(mockWishDataSource.getWishlist()).thenAnswer((_) async => <Wish>[
      Wish(id: 9, icon: 'icon_name', name: 'Wishlist name', price: 99),
    ]);
    repo.getWishlist().then((list) {
      expect(list.length, 1);
      expect(list[0].id, 9);
      expect(list[0].icon, 'icon_name');
      expect(list[0].name, 'Wishlist name');
      expect(list[0].price, 99);
    });
  });

  test('test wishlist repo impl emtpy wishlist', () {
    when(mockWishDataSource.getWishlist()).thenAnswer((_) async => <Wish>[]);
    repo.getWishlist().then((list) {
      expect(list, isEmpty);
    });
  });
}
