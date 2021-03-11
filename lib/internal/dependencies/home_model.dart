import 'package:test_flutter/data/server/test_server.dart';
import 'package:test_flutter/domain/state/home_state.dart';
import 'package:test_flutter/data/test_repository.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(TestRepository(TestServer()));
  }
}
