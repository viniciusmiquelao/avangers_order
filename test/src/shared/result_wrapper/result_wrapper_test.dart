import 'package:avangers_order/src/shared/errors/base_error.dart';
import 'package:avangers_order/src/shared/result_wrapper/result_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result wrapper', () {
    test('Result success', () async {
      final result = ResultSuccess('any');

      expect(result.isSuccess, true);
      expect(result.isError, false);
    });

    test('Result error', () async {
      final result = ResultError(BaseError('any'));

      expect(result.isError, true);
      expect(result.isSuccess, false);
    });
  });

  test('ResultSucess return', () async {
    final result = ResultSuccess('any');

    expect(result.isSuccess, true);
    expect(result, isA<ResultSuccess<String>>());
    expect(result.getSuccessData, isA<String>());
  });
}
