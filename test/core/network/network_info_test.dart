import 'package:budupdated/core/network/network_info.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfoImpl;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('is connected', () {
    // is connected returned has connection
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        // arrange
        when(mockDataConnectionChecker.hasConnection)
            .thenAnswer((_) async => true);

        // act
        final result = await networkInfoImpl.isConnected;

        // assert
        verify(mockDataConnectionChecker.hasConnection);
        expect(result, true);
      },
    );
  });
}
