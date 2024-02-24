// Mocks generated by Mockito 5.4.2 from annotations
// in crm_smart/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:crm_smart/core/common/models/profile_invoice_model.dart' as _i6;
import 'package:crm_smart/core/common/widgets/profile_comments_model.dart'
    as _i7;
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart'
    as _i5;
import 'package:crm_smart/features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i3;
import 'package:crm_smart/model/invoiceModel.dart' as _i8;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i10;
import 'package:mockito/annotations.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AgentsDistributorsProfileRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockAgentsDistributorsProfileRepo extends _i1.Mock
    implements _i3.AgentsDistributorsProfileRepo {
  MockAgentsDistributorsProfileRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<String, List<_i5.ClientModel>>> getAgentsClientsList(
          {required String? agentId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAgentsClientsList,
          [],
          {#agentId: agentId},
        ),
        returnValue:
            _i4.Future<_i2.Either<String, List<_i5.ClientModel>>>.value(
                _FakeEither_0<String, List<_i5.ClientModel>>(
          this,
          Invocation.method(
            #getAgentsClientsList,
            [],
            {#agentId: agentId},
          ),
        )),
      ) as _i4.Future<_i2.Either<String, List<_i5.ClientModel>>>);

  @override
  _i4.Future<
      _i2.Either<String, List<_i6.ProfileInvoiceModel>>> getAgentInvoicesList(
          {required String? agentId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAgentInvoicesList,
          [],
          {#agentId: agentId},
        ),
        returnValue:
            _i4.Future<_i2.Either<String, List<_i6.ProfileInvoiceModel>>>.value(
                _FakeEither_0<String, List<_i6.ProfileInvoiceModel>>(
          this,
          Invocation.method(
            #getAgentInvoicesList,
            [],
            {#agentId: agentId},
          ),
        )),
      ) as _i4.Future<_i2.Either<String, List<_i6.ProfileInvoiceModel>>>);

  @override
  _i4.Future<_i2.Either<String, List<_i7.ProfileCommentModel>>>
      getParticipateCommentsList({required String? agentId}) =>
          (super.noSuchMethod(
            Invocation.method(
              #getParticipateCommentsList,
              [],
              {#agentId: agentId},
            ),
            returnValue: _i4.Future<
                    _i2.Either<String, List<_i7.ProfileCommentModel>>>.value(
                _FakeEither_0<String, List<_i7.ProfileCommentModel>>(
              this,
              Invocation.method(
                #getParticipateCommentsList,
                [],
                {#agentId: agentId},
              ),
            )),
          ) as _i4.Future<_i2.Either<String, List<_i7.ProfileCommentModel>>>);

  @override
  _i4.Future<_i2.Either<String, _i7.ProfileCommentModel>> addAgentComment({
    required String? agentId,
    required String? content,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addAgentComment,
          [],
          {
            #agentId: agentId,
            #content: content,
          },
        ),
        returnValue:
            _i4.Future<_i2.Either<String, _i7.ProfileCommentModel>>.value(
                _FakeEither_0<String, _i7.ProfileCommentModel>(
          this,
          Invocation.method(
            #addAgentComment,
            [],
            {
              #agentId: agentId,
              #content: content,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<String, _i7.ProfileCommentModel>>);

  @override
  _i4.Future<
      _i2.Either<String, List<_i8.DateInstallationClient>>> getDateVisitAgent(
          {required String? agentId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDateVisitAgent,
          [],
          {#agentId: agentId},
        ),
        returnValue: _i4
            .Future<_i2.Either<String, List<_i8.DateInstallationClient>>>.value(
            _FakeEither_0<String, List<_i8.DateInstallationClient>>(
          this,
          Invocation.method(
            #getDateVisitAgent,
            [],
            {#agentId: agentId},
          ),
        )),
      ) as _i4.Future<_i2.Either<String, List<_i8.DateInstallationClient>>>);

  @override
  _i4.Future<_i2.Either<String, void>> addAgentDate(
          {required _i8.DateInstallationClient? agentDateModel}) =>
      (super.noSuchMethod(
        Invocation.method(
          #addAgentDate,
          [],
          {#agentDateModel: agentDateModel},
        ),
        returnValue: _i4.Future<_i2.Either<String, void>>.value(
            _FakeEither_0<String, void>(
          this,
          Invocation.method(
            #addAgentDate,
            [],
            {#agentDateModel: agentDateModel},
          ),
        )),
      ) as _i4.Future<_i2.Either<String, void>>);
}

/// A class which mocks [MockSpec].
///
/// See the documentation for Mockito's code generation for more information.
class HttpClientMock extends _i1.Mock implements _i9.MockSpec<_i10.Client> {
  HttpClientMock() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Type> get mixins => (super.noSuchMethod(
        Invocation.getter(#mixins),
        returnValue: <Type>[],
      ) as List<Type>);

  @override
  bool get returnNullOnMissingStub => (super.noSuchMethod(
        Invocation.getter(#returnNullOnMissingStub),
        returnValue: false,
      ) as bool);

  @override
  Set<Symbol> get unsupportedMembers => (super.noSuchMethod(
        Invocation.getter(#unsupportedMembers),
        returnValue: <Symbol>{},
      ) as Set<Symbol>);

  @override
  Map<Symbol, Function> get fallbackGenerators => (super.noSuchMethod(
        Invocation.getter(#fallbackGenerators),
        returnValue: <Symbol, Function>{},
      ) as Map<Symbol, Function>);
}
