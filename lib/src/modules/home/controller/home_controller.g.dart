// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$textAtom =
      Atom(name: '_HomeControllerBase.text', context: context);

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$_urlAtom =
      Atom(name: '_HomeControllerBase._url', context: context);

  @override
  Uri get _url {
    _$_urlAtom.reportRead();
    return super._url;
  }

  @override
  set _url(Uri value) {
    _$_urlAtom.reportWrite(value, super._url, () {
      super._url = value;
    });
  }

  late final _$showDeleteConfirmationAtom = Atom(
      name: '_HomeControllerBase.showDeleteConfirmation', context: context);

  @override
  bool get showDeleteConfirmation {
    _$showDeleteConfirmationAtom.reportRead();
    return super.showDeleteConfirmation;
  }

  @override
  set showDeleteConfirmation(bool value) {
    _$showDeleteConfirmationAtom
        .reportWrite(value, super.showDeleteConfirmation, () {
      super.showDeleteConfirmation = value;
    });
  }

  late final _$saveTextAsyncAction =
      AsyncAction('_HomeControllerBase.saveText', context: context);

  @override
  Future<void> saveText(String input) {
    return _$saveTextAsyncAction.run(() => super.saveText(input));
  }

  late final _$loadTextAsyncAction =
      AsyncAction('_HomeControllerBase.loadText', context: context);

  @override
  Future<void> loadText() {
    return _$loadTextAsyncAction.run(() => super.loadText());
  }

  late final _$removeTextAsyncAction =
      AsyncAction('_HomeControllerBase.removeText', context: context);

  @override
  Future<void> removeText() {
    return _$removeTextAsyncAction.run(() => super.removeText());
  }

  late final _$goToPoliticsPageAsyncAction =
      AsyncAction('_HomeControllerBase.goToPoliticsPage', context: context);

  @override
  Future<void> goToPoliticsPage() {
    return _$goToPoliticsPageAsyncAction.run(() => super.goToPoliticsPage());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void toggleDeleteConfirmation() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.toggleDeleteConfirmation');
    try {
      return super.toggleDeleteConfirmation();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text},
showDeleteConfirmation: ${showDeleteConfirmation}
    ''';
  }
}
