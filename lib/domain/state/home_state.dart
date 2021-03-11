import 'package:mobx/mobx.dart';
import 'package:test_flutter/data/model/list_model.dart';
import 'package:test_flutter/data/model/page_model.dart';
import 'package:test_flutter/data/test_repository.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._testRepository);

  final TestRepository _testRepository;

  @observable
  PageModel pageModel;

  @observable
  ListModel dataModel;

  @observable
  bool isLoading = false;

  @action
  Future<void> getContent() async {
    final data = await _testRepository.getContent();
    dataModel = data;
  }

  @action
  Future<void> getContentPage(int index) async {
    final data = await _testRepository.getPageContent(index);
    pageModel = data;
  }
}
