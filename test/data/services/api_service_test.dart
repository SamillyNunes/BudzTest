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
}
