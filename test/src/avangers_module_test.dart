import 'package:avangers_order/src/avengers_module.dart';
import 'package:avangers_order/src/config/avengers_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('[MODULE] - modulos', () {
    Module module = AvengersModule();
    AvengersRoutes routes = AvengersRoutes();
    for (var element in module.routes) {
      var containsRute = routes.props.contains(element.name);
      expect(containsRute, true);
    }
    expect(module.routes.isEmpty, false);
  });
}
