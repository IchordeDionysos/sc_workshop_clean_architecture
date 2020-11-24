import 'package:sc_clean_architecture/domain/entities/wish.dart';
import 'package:sc_clean_architecture/domain/repositories/wishlist_repo.dart';
import 'package:sc_clean_architecture/domain/usecases/getwishlist.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockWishlistRepo extends Mock implements WishlistRepo {}

void main() {
  MockWishlistRepo mockWishlistRepo;
  GetWishlist useCase;

  setUp(() {
    mockWishlistRepo = MockWishlistRepo();
    useCase = GetWishlist(mockWishlistRepo);
  });

  test('test getwishlist use-case', () {
    when(mockWishlistRepo.getWishlist()).thenAnswer((_) async => <Wish>[
      Wish(id: 9, icon: 'icon_name', name: 'Wishlist name', price: 99),
    ]);
    useCase.call().then((list) {
      expect(list.length, 1);
      expect(list[0].id, 9);
      expect(list[0].icon, 'icon_name');
      expect(list[0].name, 'Wishlist name');
      expect(list[0].price, 99);
    });
  });

  test('test getwishlist use-case emtpy wishlist', () {
    when(mockWishlistRepo.getWishlist()).thenAnswer((_) async => <Wish>[]);
    useCase.call().then((list) {
      expect(list, isEmpty);
    });
  });
}
