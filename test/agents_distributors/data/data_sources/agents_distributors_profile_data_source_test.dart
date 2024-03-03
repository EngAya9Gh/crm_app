import 'package:crm_smart/core/common/models/profile_invoice_model.dart';
import 'package:crm_smart/core/common/widgets/profile_comments_model.dart';
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart';
import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockApiServices mockApiServices;
  late AgentsDistributorsProfileDataSourceImpl dataSource;
  final agentId = "1";

  setUp(() {
    mockApiServices = MockApiServices();
    dataSource = AgentsDistributorsProfileDataSourceImpl(mockApiServices);
  });

  group("Agents and Distributors Profile DataSource", () {
    test("getAgentClientsList", () async {
      // Arrange
      final String endPoint = EndPoints.agentDistributor.getAgentClients;

      when(mockApiServices.get(
        endPoint: "$endPoint$agentId",
      )).thenAnswer((_) async => {
            "data": [
              {
                "id_clients": 4645,
                "name_client": "عبدالسلام مفتاح قاسم",
                "name_enterprise": "قاسم للزيوت والمواد المضافة",
                "type_client": "مشترك",
                "fk_regoin": "9",
                "fk_user": "216",
                "offer_price": null,
                "date_price": null,
                "date_create": "2022-05-11 14:28:00",
                "tag": null,
                "nameCountry": "السعودية",
                "name_regoin": "فرع اسطنبول",
                "nameUser": "hadil",
                "fk_country": 1
              },
              {
                "id_clients": 5679,
                "name_client": "رشاد العربي",
                "name_enterprise": "أفاق الصحة",
                "type_client": "مشترك",
                "fk_regoin": "9",
                "fk_user": "119",
                "offer_price": null,
                "date_price": null,
                "date_create": "2022-08-11 10:43:00",
                "tag": null,
                "nameCountry": "السعودية",
                "name_regoin": "فرع اسطنبول",
                "nameUser": "خالد مرعي",
                "fk_country": 1
              },
            ]
          });

      // Act
      final result = await dataSource.getAgentClientsList(agentId: agentId);

      // Assert
      expect(result, isA<Right<String, List<ClientModel>>>());
    });

    test("getAgentInvoiceList", () async {
      // Arrange
      final String endPoint = EndPoints.agentDistributor.getAgentInvoicesList;

      when(mockApiServices.get(
        endPoint: "$endPoint$agentId",
      )).thenAnswer((_) async => {
            "data": [
              {
                "id_invoice": 1714,
                "date_create": "2022-05-11 14:35:45",
                "fk_idClient": 4645,
                "fk_idUser": "216",
                "notes":
                    "تم التعاقد مع العميل من خلال الموزع ورقم الموبايل المضاف هو رقم الموزع حيث سيقوم هو بالتنسيق مع العميل للحضور سويا مع العميل ",
                "total": "882",
                "dateinstall_done": "2022-05-17 13:26:46",
                "date_approve": "2022-05-11 14:35:45",
                "address_invoice": "قاسم للزيوت والمواد المضافة",
                "invoice_source": null,
                "amount_paid": "882",
                "renew_year": "617",
                "Date_FApprove": null,
                "stateclient": "مشترك",
                "approve_back_done": null,
                "isApprove": "1",
                "name_regoin": "فرع اسطنبول",
                "currency_name": "0",
                "nameCountry": "السعودية",
                "nameUser": "hadil",
                "fk_country": 1,
                "name_enterprise": "قاسم للزيوت والمواد المضافة",
                "name_client": "عبدالسلام مفتاح قاسم"
              },
              {
                "id_invoice": 1973,
                "date_create": "2022-08-11 10:43:44",
                "fk_idClient": 5679,
                "fk_idUser": "119",
                "notes": "باقة متقدمة 3 أفرع و مستودع اضافي",
                "total": "1260",
                "dateinstall_done": "2022-08-21 09:38:26",
                "date_approve": "2022-08-11 14:01:37",
                "address_invoice": "رشاد العربي شركة افاق الصحة",
                "invoice_source": null,
                "amount_paid": "1260",
                "renew_year": "860",
                "Date_FApprove": null,
                "stateclient": "مشترك",
                "approve_back_done": null,
                "isApprove": "1",
                "name_regoin": "فرع اسطنبول",
                "currency_name": "0",
                "nameCountry": "السعودية",
                "nameUser": "خالد مرعي",
                "fk_country": 1,
                "name_enterprise": "أفاق الصحة",
                "name_client": "رشاد العربي"
              },
            ],
          });

      // Act
      final result = await dataSource.getAgentInvoiceList(agentId: agentId);

      // Assert
      expect(result, isA<Right<String, List<ProfileInvoiceModel>>>());
    });

    test("getAgentCommentsList", () async {
      // Arrange
      final String endPoint = EndPoints.agentDistributor.getAgentCommentsList;

      when(mockApiServices.get(
        endPoint: "$endPoint$agentId",
      )).thenAnswer((_) async => {
            "data": [
              {
                "agent_id": 2,
                "content": "m",
                "date_comment": "2024-02-25 00:00:00",
                "user_id": 423,
                "id": 29,
                "nameUser": "abdullah.bokl",
                "img_image": "",
                "name_agent": "محمد أبو القاسم",
                "type_agent": 1,
                "image_agent": ""
              },
              {
                "agent_id": 2,
                "content": "h",
                "date_comment": "2024-02-25 00:00:00",
                "user_id": 423,
                "id": 28,
                "nameUser": "abdullah.bokl",
                "img_image": "",
                "name_agent": "محمد أبو القاسم",
                "type_agent": 1,
                "image_agent": ""
              },
            ],
          });

      // Act
      final result = await dataSource.getAgentCommentsList(agentId: agentId);

      // Assert
      expect(result, isA<Right<String, List<ProfileCommentModel>>>());
    });

    test("addAgentComment", () async {
      // Arrange
      final String content = "content";
      final String endPoint = EndPoints.agentDistributor.addCommentAgent;

      when(mockApiServices.post(
        endPoint: endPoint,
        data: {
          "agent_id": agentId,
          "content": content,
        },
      )).thenAnswer((_) async => {
            "data": {
              "agent_id": 2,
              "content": "ii",
              "date_comment": "2024-02-28 03:24:34",
              "user_id": 413,
              "id": 34,
              "nameUser": "anas",
              "img_image": "",
              "name_agent": "محمد أبو القاسم",
              "type_agent": 1,
              "image_agent": ""
            },
          });

      // Act
      final result = await dataSource.addAgentComment(
        agentId: agentId,
        content: content,
      );

      // Assert
      expect(result, isA<Right<String, ProfileCommentModel>>());
    });

    test("getDateVisitAgent", () async {
      // Arrange
      final String endPoint = EndPoints.agentDistributor.getDateVisitAgent;

      when(mockApiServices.get(
        endPoint: "$endPoint$agentId",
      )).thenAnswer((_) async => {
            "data": [
              {
                "idclients_date": 1517,
                "date_client_visit": "2024-02-15 15:48:51",
                "fk_user": 1,
                "is_done": 1,
                "fk_client": null,
                "fk_invoice": null,
                "type_date": "ميداني",
                "processReason": null,
                "user_id_process": null,
                "fk_agent": 1,
                "date_end": null,
                "name_agent": "شادي مشهود"
              },
              {
                "idclients_date": 1518,
                "date_client_visit": "2023-08-01 11:01:22",
                "fk_user": 1,
                "is_done": 0,
                "fk_client": null,
                "fk_invoice": null,
                "type_date": "اونلاين",
                "processReason": null,
                "user_id_process": null,
                "fk_agent": 1,
                "date_end": null,
                "name_agent": "شادي مشهود"
              },
            ],
          });

      // Act
      final result = await dataSource.getDateVisitAgent(agentId: agentId);

      // Assert
      expect(result, isA<Right<String, List<DateInstallationClient>>>());
    });

    test("addAgentDate", () async {
      // Arrange
      final String endPoint = EndPoints.agentDistributor.addAgentDate;
      final DateInstallationClient agentDateModel = DateInstallationClient();

      when(mockApiServices.post(
        endPoint: endPoint,
        data: agentDateModel.toMap(),
      )).thenAnswer((_) async => {
            "result": "success",
            "code": "200",
            "message": "1587",
          });

      // Act
      final result =
          await dataSource.addAgentDate(agentDateModel: agentDateModel);

      // Assert
      expect(result, isA<Right<String, void>>());
    });

    test("doneTraining", () async {
      // Arrange
      final String fkUser = "1";
      final String endPoint = EndPoints.agentDistributor.doneTraining;

      when(mockApiServices.post(
        endPoint: endPoint,
        data: {"fkuser_training": fkUser},
        queryParameters: {"id_agent": agentId},
      )).thenAnswer((_) async => {
            "message": [
              {
                "id_agent": "1",
                "name_agent": "شادي مشهود",
                "type_agent": "1",
                "email_egent": "shadi.nova1@gmail.com",
                "mobile_agent": "5349714902",
                "fk_country": "15",
                "description": " asd",
                "image_agent": "",
                "cityId": "4",
                "add_date": "2024-02-08 19:31:14",
                "update_date": "2024-02-21 19:54:59",
                "fk_user_add": null,
                "fk_user_update": "0",
                "fkuser_training": "408",
                "is_training": "1",
                "date_training": "2024-02-28 04:39:25",
                "name_city": "الخبر",
                "nameUserAdd": null,
                "nameUserUpdate": null,
                "nameusertraining": "eng.anas"
              }
            ],
          });

      // Act
      final result = await dataSource.doneTraining(
        agentId: agentId,
        fkUser: fkUser,
      );

      // Assert
      expect(result, isA<Right<String, AgentDistributorModel>>());
    });
  });
}
