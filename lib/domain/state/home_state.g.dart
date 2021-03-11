// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeState on HomeStateBase, Store {
  final _$pageModelAtom = Atom(name: 'HomeStateBase.pageModel');

  @override
  PageModel get pageModel {
    _$pageModelAtom.reportRead();
    return super.pageModel;
  }

  @override
  set pageModel(PageModel value) {
    _$pageModelAtom.reportWrite(value, super.pageModel, () {
      super.pageModel = value;
    });
  }

  final _$dataModelAtom = Atom(name: 'HomeStateBase.dataModel');

  @override
  ListModel get dataModel {
    _$dataModelAtom.reportRead();
    return super.dataModel;
  }

  @override
  set dataModel(ListModel value) {
    _$dataModelAtom.reportWrite(value, super.dataModel, () {
      super.dataModel = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'HomeStateBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getContentAsyncAction = AsyncAction('HomeStateBase.getContent');

  @override
  Future<void> getContent() {
    return _$getContentAsyncAction.run(() => super.getContent());
  }

  final _$getContentPageAsyncAction =
      AsyncAction('HomeStateBase.getContentPage');

  @override
  Future<void> getContentPage(int index) {
    return _$getContentPageAsyncAction.run(() => super.getContentPage(index));
  }

  @override
  String toString() {
    return '''
pageModel: ${pageModel},
dataModel: ${dataModel},
isLoading: ${isLoading}
    ''';
  }
}
