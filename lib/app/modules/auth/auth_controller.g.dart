// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on AuthControllerBase, Store {
  late final _$_userIsAuthenticatedAtom =
      Atom(name: 'AuthControllerBase._userIsAuthenticated', context: context);

  bool? get userIsAuthenticated {
    _$_userIsAuthenticatedAtom.reportRead();
    return super._userIsAuthenticated;
  }

  @override
  bool? get _userIsAuthenticated => userIsAuthenticated;

  @override
  set _userIsAuthenticated(bool? value) {
    _$_userIsAuthenticatedAtom.reportWrite(value, super._userIsAuthenticated,
        () {
      super._userIsAuthenticated = value;
    });
  }

  late final _$isAuthenticateAsyncAction =
      AsyncAction('AuthControllerBase.isAuthenticate', context: context);

  @override
  Future<void> isAuthenticate() {
    return _$isAuthenticateAsyncAction.run(() => super.isAuthenticate());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
