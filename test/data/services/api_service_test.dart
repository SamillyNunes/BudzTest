import 'package:budz_app/data/services/api_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([AssetBundle])
void main() {
  late ApiService apiService;
  late MockAssetBundle mockAssetBundle;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockAssetBundle = MockAssetBundle();
    apiService = ApiService(bundle: mockAssetBundle);
  });
  test('loadJson method should return parsed JSON data correctly', () async {
    const jsonString = '{"pet":{"name":"Baby", "breed": "Pinscher"}}';

    // Quando tentar ler alguma string, vai responder com esse json
    when(mockAssetBundle.loadString(any)).thenAnswer((_) async => jsonString);

    final data = await apiService.loadJson();

    expect(data['pet']['name'], 'Baby');
  });

  test('fecthPet method should return a PetModel object', () async {
    const jsonString =
        '{"pet":{"name":"Baby", "breed": "Pinscher", "gender": "female","id": "AABBCC0101","photoUrl": "","mainPet": true,"specie": "dog"}}';
    when(mockAssetBundle.loadString(any)).thenAnswer((_) async => jsonString);

    final pet = await apiService.fetchPet();

    expect(pet.name, 'Baby');
    expect(pet.breed, 'Pinscher');
  });

  test('fecthBanners method should return a List of BannerModel', () async {
    const jsonString =
        '{"banners":[{"audience": "all","status": true,"id": "abababa","partner": "budz","priority": 2,"link": "https://www.dnapets.com.br/?utm_source=budz&utm_medium=banner","targetSpecie": "all","imageURL": ""}]}';
    when(mockAssetBundle.loadString(any)).thenAnswer((_) async => jsonString);

    final banners = await apiService.fetchBanners();

    expect(banners.length, 1);
    expect(banners[0].id, 'abababa');
  });

  test('fetchCategories should return a CategoryModel list', () async {
    const jsonString =
        '{"categories":[{"name": "Educação","id": "EE78","imageUrlSquare": ""}]}';
    when(mockAssetBundle.loadString(any)).thenAnswer((_) async => jsonString);

    final categories = await apiService.fetchCategories();

    expect(categories.length, 1);
    expect(categories[0].id, 'EE78');
  });

  test('fetchArticles should return a ArticleModel list', () async {
    const jsonString =
        '{"articles":[{"categoryName": "Primeiros socorros","id": "AAEE12","colorCode": "#C5C94F","title": "Como desengaasgar","imageUrlSquare":""}]}';
    when(mockAssetBundle.loadString(any)).thenAnswer((_) async => jsonString);

    final articles = await apiService.fetchArticles();

    expect(articles.length, 1);
    expect(articles[0].id, 'AAEE12');
  });
}
