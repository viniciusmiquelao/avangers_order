import 'package:equatable/equatable.dart';

class AvengersRoutes extends Equatable {
  static const rootRoute = '/';
  static const home = '/home';

  @override
  List<Object?> get props => [
        rootRoute,
        home,
      ];
}
