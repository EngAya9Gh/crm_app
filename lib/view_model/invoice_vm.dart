import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/api.dart';
import '../core/common/enums/seller_type_enum.dart';
import '../core/common/enums/toast_colors_enum.dart';
import '../core/common/helpers/api_data_handler.dart';
import '../core/common/helpers/app_snackbar.dart';
import '../core/common/helpers/check_sorage_permission.dart';
import '../core/common/models/participate_model.dart';
import '../core/errors/base_app_exception.dart';
import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../features/sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../model/invoiceModel.dart';
import '../model/usermodel.dart';
import '../services/Invoice_Service.dart';
import '../ui/screen/invoice/invoice_images_file.dart';
import '../ui/widgets/app_file_viewer.dart';
import 'page_state.dart';

const CACHE_InvoiceClient_KEY = "CACHE_InvoiceClient_KEY";
const CACHE_InvoiceClient_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

const CACHE_Invoice_Deleted_KEY = "CACHE_Invoice_Deleted_KEY";
const CACHE_Invoice_Deleted_INTERVAL = 60 * 1000; // 30s in millis

enum SellerStatus { init, loading, loaded, failed }

class InvoiceVm extends ChangeNotifier {
  String total = '0';

  InvoiceModel? currentInvoice;

  setCurrentInvoice(InvoiceModel invoice, {bool needRefresh = false}) {
    currentInvoice = invoice;
    if (needRefresh) {
      notifyListeners();
    }
  }

  void set_total(val) {
    if (val == null || val == "null") return;
    total = val;
    notifyListeners();
  }

  bool _isloading = false;

  bool get isloading => _isloading;

  set isloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  bool isloading_marketing = false;
  UserModel? usercurrent;

  void setvalue(user) {
    usercurrent = user;
    notifyListeners();
  }

  PageState<List<AgentDistributorModel>> agentDistributorsState = PageState();
  PageState<List<ParticipateModel>> collaboratorsState = PageState();
  ParticipateModel? selectedCollaborator;
  AgentDistributorModel? selectedAgent;
  AgentDistributorModel? selectedDistributor;
  SellerTypeEnum? selectedSellerType = SellerTypeEnum.employee;

  bool isLoadingInvoicesClientLocal = false;
  List<InvoiceModel> listInvoiceClient = [];
  List<InvoiceModel> listdeletedinvoice = [];
  List<ProductsInvoice> productsInvoiceList = [];
  List<ProductsInvoice> addedProductsInvoice = [];
  List<ProductsInvoice> editProductsInvoiceRemote = [];
  List<String> deleteProductsInvoice = [];
  List<InvoiceModel> listinvoices = [];
  List<InvoiceModel> listinvoicesMarketing = [];
  List<InvoiceModel> listInvoicesAccept = []; //مشتركين
  List<InvoiceModel> listInvoicesAccept_admin = []; //مشتركين

  Future<void> searchmarketing(
      String productName, PrivilegesCubit privilegeCubit) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listinvoicesMarketing.isNotEmpty) {
        listinvoicesMarketing.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0))
            _listInvoicesAccept.add(element);
        });
        listinvoicesMarketing = _listInvoicesAccept;
      }
    } else
      getinvoice_marketing(
          privilegeCubit); //getinvoice_Local("مشترك",'approved client',null);
    notifyListeners();
  }

  void getinvoice_marketing(PrivilegesCubit privilegeCubit) async {
    listinvoicesMarketing = [];
    isloading_marketing = true;
    notifyListeners();
    await getinvoiceswithprev_marketing(privilegeCubit);
    list_temp = List.from(listInvoicesAccept);
    listinvoicesMarketing = List.from(list_temp);
    isloading_marketing = false;
    notifyListeners();
  }

  void setisload({bool isLoading = false}) {
    isloadingdone = isLoading;
    notifyListeners();
  }

  List<InvoiceModel> list_temp = [];

  Future<void> onFilterInvoice(
      String? invoiceStatus, String? region, String? query) async {
    final list = List<InvoiceModel>.from(list_temp);

    listinvoicesMarketing = list.where((element) {
      if ((region == null || region == '0') &&
          (invoiceStatus == null || invoiceStatus == 'الكل')) {
        return true && filterQuery(element, query);
      } else if ((region != null && region != '0') &&
          (invoiceStatus == null || invoiceStatus == 'الكل')) {
        return element.fk_regoin == region && filterQuery(element, query);
      } else if ((region == null || region == '0') &&
          (invoiceStatus != null && invoiceStatus != 'الكل')) {
        if (invoiceStatus == "بالإنتظار") {
          return isWaitingInvoice(element) && filterQuery(element, query);
        } else if (invoiceStatus == "تم التركيب") {
          return isInstallingInvoice(element) && filterQuery(element, query);
        } else {
          return isPendingInvoice(element) && filterQuery(element, query);
        }
      } else {
        final typeCondition;

        if (invoiceStatus == "بالإنتظار") {
          typeCondition = isWaitingInvoice(element);
        } else if (invoiceStatus == "تم التركيب") {
          typeCondition = isInstallingInvoice(element);
        } else {
          typeCondition = isPendingInvoice(element);
        }

        return typeCondition &&
            region == element.fk_regoin &&
            filterQuery(element, query);
      }
    }).toList();

    notifyListeners();
  }

  bool isWaitingInvoice(InvoiceModel invoiceModel) =>
      invoiceModel.isdoneinstall == null;

  bool isPendingInvoice(InvoiceModel invoiceModel) =>
      invoiceModel.isdoneinstall != '1' && invoiceModel.ready_install == '0';

  bool isInstallingInvoice(InvoiceModel invoiceModel) =>
      invoiceModel.isdoneinstall == '1';

  bool filterQuery(InvoiceModel element, String? query) {
    if (query?.isEmpty ?? true) {
      return true;
    }

    return (element.address_invoice!
            .toLowerCase()
            .contains(query!.toLowerCase()))
        // ||
        // (element.mobile!.toLowerCase().contains(query.toLowerCase())) ||
        // (element.nameClient!.toLowerCase().contains(query.toLowerCase()) )
        ;
  }

  void addNewProductInvoice(value) {
    productsInvoiceList.add(value);
    addedProductsInvoice.add(value);
    notifyListeners();
  }

  void removeProduct({
    String? idInvoiceProduct,
    String? localId,
  }) {
    if (idInvoiceProduct != null) {
      _removeRemoteProduct(idInvoiceProduct);
    } else {
      _removeLocalProduct(localId!);
    }
    notifyListeners();
  }

  void _removeRemoteProduct(String idInvoiceProduct) {
    productsInvoiceList.removeWhere((element) {
      return element.idInvoiceProduct == idInvoiceProduct;
    });

    editProductsInvoiceRemote.removeWhere((element) {
      return element.idInvoiceProduct == idInvoiceProduct;
    });

    deleteProductsInvoice.add(idInvoiceProduct);
  }

  void _removeLocalProduct(String localId) {
    productsInvoiceList.removeWhere((element) {
      return element.localId == localId;
    });

    addedProductsInvoice.removeWhere((element) {
      return element.localId == localId;
    });
  }

  void editProduct(ProductsInvoice product) {
    if (product.idInvoiceProduct != null) {
      _editRemoteProduct(product);
    } else {
      _editLocalProduct(product);
    }
    notifyListeners();
  }

  void _editRemoteProduct(ProductsInvoice product) {
    // edit in productsInvoiceList
    int index = productsInvoiceList.indexWhere((element) {
      return element.idInvoiceProduct == product.idInvoiceProduct;
    });

    if (index != -1) {
      productsInvoiceList[index] = product;
    }

    // edit in editProductsInvoiceRemote
    index = editProductsInvoiceRemote.indexWhere((element) {
      return element.idInvoiceProduct == product.idInvoiceProduct;
    });

    if (index == -1) {
      editProductsInvoiceRemote.add(product);
    } else {
      editProductsInvoiceRemote[index] = product;
    }
  }

  void _editLocalProduct(ProductsInvoice product) {
    // edit in productsInvoiceList
    int index = productsInvoiceList.indexWhere((element) {
      return element.localId == product.localId;
    });

    if (index != -1) {
      productsInvoiceList[index] = product;
    }

    // edit in addEdProductsInvoice
    index = addedProductsInvoice.indexWhere((element) {
      return element.localId == product.localId;
    });

    if (index != -1) {
      addedProductsInvoice[index] = product;
    }
  }

  double calculateTotal() {
    double total = 0;

    productsInvoiceList.forEach((element) {
      total += double.parse(
        element.price.toString(),
      );
    });

    set_total(total.toString());

    return total;
  }

  bool isapproved = false;

  Future<bool> setApproveclient_vm(
    Map<String, dynamic> body,
    String? idInvoice,
  ) async {
    try {
      isapproved = true;
      notifyListeners();
      InvoiceModel? data =
          await Invoice_Service().setApproveClient(body, idInvoice!);
      int index =
          listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
      int iindex = listInvoicesAccept
          .indexWhere((element) => element.idInvoice == idInvoice);
      int iindexadmin = listInvoicesAccept_admin
          .indexWhere((element) => element.idInvoice == idInvoice);
      if (index != -1) {
        if (data != null) {
          listinvoices[index] = data;
        } else {
          listinvoices.removeAt(index);
        }
      }
      if (iindex != -1) listInvoicesAccept.removeAt(iindex);
      if (iindexadmin != -1) listInvoicesAccept_admin.removeAt(iindexadmin);
      isapproved = false;
      notifyListeners();

      return true;
    } catch (e) {
      debugPrint("error in setApproveclient_vm => $e");
      isapproved = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> setApproveFclient_vm(
      Map<String, dynamic> body, String? idInvoice) async {
    isapproved = true;
    notifyListeners();
    InvoiceModel? data =
        await Invoice_Service().setApproveFClient({}, idInvoice!);
    int index =
        listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
    int iindex = listInvoicesAccept
        .indexWhere((element) => element.idInvoice == idInvoice);
    int iindex_ff = listInvoicesAccept_admin
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index != -1) {
      if (data != null) {
        listinvoices[index] = data;
      } else {
        listinvoices.removeAt(index);
      }
    }
    if (iindex != -1) listInvoicesAccept.removeAt(iindex);
    if (iindex_ff != -1) listInvoicesAccept_admin.removeAt(iindex_ff);
    isapproved = false;
    notifyListeners();

    return true;
  }

  Future<void> getInvoiceByClient(String? fk_client) async {
    try {
      listInvoiceClient = [];
      isLoadingInvoicesClientLocal = true;
      notifyListeners();
      listInvoiceClient =
          await Invoice_Service().getInvoiceByClient(fk_client!);
      isLoadingInvoicesClientLocal = false;
      notifyListeners();
    } catch (e) {
      isLoadingInvoicesClientLocal = false;
      notifyListeners();
    }
  }

  Future<void> getinvoiceswithprev_marketing(
      PrivilegesCubit privilegeCubit) async {
    //main list
    bool res = privilegeCubit.checkPrivilege('130');
    if (res) {
      listinvoices = await Invoice_Service()
          .getinvoiceMarketing(usercurrent!.fkCountry.toString());
    } else {
      res = privilegeCubit.checkPrivilege('131');
      if (res) {
        listinvoices = await Invoice_Service()
            .getinvoicebyregoin_marketing(usercurrent!.fkRegoin!);
      } else {
        res = privilegeCubit.checkPrivilege('132');
        if (res) {
          listinvoices = await Invoice_Service()
              .getinvoicebyiduser_marketing(usercurrent!.idUser.toString());
        }
      }
    }
    listInvoicesAccept = List.from(listinvoices);
    notifyListeners();
  }

  Future<String> AddInvoiceClientVm(
    Map<String, dynamic> body,
    XFile? file,
    XFile? myfilelogo,
    List<XFile> files, {
    required ValueChanged<InvoiceModel> onAddInvoiceSuccess,
    Function(String error)? onFail,
  }) async {
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.postRequestWithFile(
        endPoint: EndPoints.invoice.addInvoice,
        data: body,
        file: file,
        fileLogo: myfilelogo,
        files: files,
      );
      final data = apiDataHandler(response);

      final InvoiceModel newInvoice = InvoiceModel.fromJson(data);

      listinvoices.insert(0, newInvoice);
      listInvoiceClient.insert(0, newInvoice);
      listInvoicesAccept.insert(0, newInvoice);

      onAddInvoiceSuccess(newInvoice);
      notifyListeners();

      return newInvoice.idInvoice.toString();
    } on BaseAppException catch (e) {
      debugPrint("error in AddInvoiceClientVm 1=> ${e.message}");
      String errorMessage = e.message ?? "";
      if (e.message == "repeated") {
        errorMessage = 'لا يمكن إضافة فاتورة فرعية بحساب جديد';
      }
      onFail?.call(errorMessage);
      throw e;
    } catch (e) {
      debugPrint("error in AddInvoiceClientVm 2=> ${e}");
      onFail?.call(e.toString());
      throw e;
    } finally {
      notifyListeners();
    }
  }

  Future<void> openFile({
    required FileAttach attachFile,
    String? baseUrl,
    required BuildContext context,
  }) async {
    baseUrl ??= EndPoints.baseUrls.laravelFilesUrl;
    try {
      if (!(await checkStoragePermission())) return;

      if (kIsWeb) {
        final url = "${baseUrl}${attachFile.fileAttach}";
        await launchUrl(Uri.parse(url));
        return;
      }

      if (attachFile.file != null &&
          !attachFile.file!.path.startsWith("blob:")) {
        return _openLocalFile(attachFile.file, context);
      }

      final String fileName =
          attachFile.fileAttach?.name ?? attachFile.file?.name ?? "";
      String filePath = "$baseUrl${attachFile.fileAttach}";
      if (attachFile.fileAttach == null) {
        filePath = attachFile.file!.path;
      }

      filesAttach = filesAttach
          .map((e) => e.id == attachFile.id
              ? e.copyWith(fileStatus: DownloadFileStatus.loading)
              : e)
          .toList();
      notifyListeners();

      final file = await Api().downloadFile(filePath, fileName);

      await Future.delayed(Duration(seconds: 1));

      if (file.existsSync()) {
        filesAttach = filesAttach
            .map((e) => e.id == attachFile.id
                ? e.copyWith(fileStatus: DownloadFileStatus.downloaded)
                : e)
            .toList();
        AppFileViewer(
          imageSource: ImageSourceViewer.file,
          files: [XFile(file.path)],
        ).show(context);
      } else {
        filesAttach = filesAttach
            .map((e) => e.id == attachFile.id
                ? e.copyWith(fileStatus: DownloadFileStatus.unDownloaded)
                : e)
            .toList();
      }

      notifyListeners();
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint("error in open file => $e");
      AppSnackbar.showSnakeBar(
        "$e",
        color: ToastColorsEnum.error,
      );
      filesAttach = filesAttach
          .map((e) => e.id == attachFile.id
              ? e.copyWith(fileStatus: DownloadFileStatus.unDownloaded)
              : e)
          .toList();
      notifyListeners();
    }
  }

  void _openLocalFile(XFile? file, BuildContext context) {
    AppFileViewer(
      imageSource: kIsWeb
          ? ImageSourceViewer.network
          : file != null
              ? ImageSourceViewer.file
              : ImageSourceViewer.network,
      files: file != null ? [file] : [],
    ).show(context);
  }

  Future<InvoiceModel?> changeDeviceState({
    required String idInvoice,
    required String deviceState,
  }) async {
    try {
      isloading = true;
      notifyListeners();

      final InvoiceModel invoice = await Invoice_Service().changeDeviceState(
        idInvoice: idInvoice,
        deviceState: deviceState,
      );

      _updateCurrentInvoice(idInvoice, invoice);

      isloading = false;
      notifyListeners();

      return invoice;
    } catch (e) {
      isloading = false;
      notifyListeners();
      return null;
    }
  }

  Future<bool> updateInvoiceClientVm({
    required Map<String, dynamic> body,
    String? idInvoice,
    XFile? file,
    XFile? fileLogo,
    List<XFile> files = const [],
    bool isDeleteFile = false,
    bool isDeleteLogo = false,
  }) async {
    try {
      isloadingdone = true;
      notifyListeners();

      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

      final response = await apiServices.postRequestWithFile(
        endPoint: "${EndPoints.invoice.updateInvoice}${idInvoice}",
        data: body,
        file: file,
        fileLogo: fileLogo,
        files: files,
        isDeleteFile: isDeleteFile,
        isDeleteLogo: isDeleteLogo,
      );

      final data = apiDataHandler(response);

      final invoice = InvoiceModel.fromJson(data);

      _updateCurrentInvoice(idInvoice, invoice);

      isloadingdone = false;
      notifyListeners();

      return true;
    } on BaseAppException catch (e) {
      debugPrint("error in updateInvoiceClientVm => ${e.message}");
      return false;
    } catch (e) {
      debugPrint("error in updateInvoiceClientVm => $e");
      rethrow;
    }
  }

  void _updateCurrentInvoice(String? idInvoice, InvoiceModel invoice) {
    int index = listInvoiceClient
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index != -1) listInvoiceClient[index] = invoice;

    index =
        listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
    if (index != -1) listinvoices[index] = invoice;

    index = listInvoicesAccept
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index != -1) listInvoicesAccept[index] = invoice;

    currentInvoice = invoice;
  }

  Future<bool> edit_invoice(
      Map<String, dynamic> body, String? idInvoice) async {
    try{
      isloadingdone = true;
      notifyListeners();
      InvoiceModel data =
      await Invoice_Service().editinvoice(body, idInvoice.toString());
      final index = listInvoiceClient
          .indexWhere((element) => element.idInvoice == idInvoice);

      if (index != -1)
        listInvoiceClient[index] = data; //InvoiceModel.fromJson(body);
      final index1 =
      listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
      if (index1 != -1) listinvoices[index1] = data;

      int index2 = listInvoicesAccept
          .indexWhere((element) => element.idInvoice == idInvoice);
      if (index2 != -1) listInvoicesAccept[index2] = data;

      isloadingdone = false;
      currentInvoice = data;
      notifyListeners();

      return true;
    }catch(e){
      isloadingdone = false;
      notifyListeners();
      return false;
    }

  }

  Future<bool> add_payment(Map<String, dynamic> body, String? idInvoice) async {
    isloadingdone = true;
    notifyListeners();
    InvoiceModel data =
        await Invoice_Service().addPayment(body, idInvoice.toString());
    final index = listInvoiceClient
        .indexWhere((element) => element.idInvoice == idInvoice);

    if (index != -1)
      listInvoiceClient[index] = data; //InvoiceModel.fromJson(body);
    final index1 =
        listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
    if (index1 != -1) listinvoices[index1] = data;

    int index2 = listInvoicesAccept
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index2 != -1) listInvoicesAccept[index2] = data;

    //InvoiceModel.fromJson(body);
    //listProduct.insert(0, ProductModel.fromJson(body));
    isloadingdone = false;
    currentInvoice = data;
    notifyListeners();

    return true;
  }

  Future<String> deleteInvoice(String idInvoice) async {
    listInvoiceClient.removeWhere((element) => element.idInvoice == idInvoice);
    notifyListeners();
    String res = await Invoice_Service().deleteInvoiceById(idInvoice);
    return res;
  }

  Future<void> set_state_back(
      Map<String, dynamic> body, String? id_invoice, XFile? file) async {
    try {
      isloading = true;
      notifyListeners();
      InvoiceModel data =
          await Invoice_Service().setInvoiceWithdraw(body, id_invoice!, file);
      int index =
          listinvoices.indexWhere((element) => element.idInvoice == id_invoice);
      if (index != -1) {
        listinvoices[index] = data;
      }
      index = listInvoiceClient
          .indexWhere((element) => element.idInvoice == id_invoice);
      if (index != -1) {
        listInvoiceClient[index] = data;
      }
      currentInvoice = data;
      index = listInvoicesAccept
          .indexWhere((element) => element.idInvoice == id_invoice);
      if (index != -1) {
        listInvoicesAccept[index] = data;
      }

      // listinvoiceClient
      // body.addAll(
      //     InvoiceModel.fromJson(listinvoices[index]));
      // listinvoices[index]= InvoiceModel.fromJson(body);
      // //listClient.removeAt(index);
      isloading = false;
      notifyListeners();
    } catch (e) {
      isloading = false;
      notifyListeners();
    }
  }

  bool isloadingdone = false;

  SellerStatus sellerStatus = SellerStatus.init;

  Future<void> getAgentsAndDistributors() async {
    try {
      if (!agentDistributorsState.isLoading) {
        agentDistributorsState = agentDistributorsState.changeToLoading;
        notifyListeners();
      }

      final list = await Invoice_Service.getAgentsAndDistributors();
      agentDistributorsState = agentDistributorsState.changeToLoaded(list);
      sellerStatus = SellerStatus.loaded;
      notifyListeners();
      return;
    } catch (e) {
      debugPrint("error in getAgentsAndDistributors invoiceVm $e");
      agentDistributorsState = agentDistributorsState.changeToFailed;
      notifyListeners();
      return;
    }
  }

  Future<void> getCollaborators() async {
    try {
      if (!collaboratorsState.isLoading) {
        collaboratorsState = collaboratorsState.changeToLoading;
        notifyListeners();
      }

      final collaborators = await Invoice_Service.getCollaborators();

      collaboratorsState = collaboratorsState.changeToLoaded(collaborators);
      sellerStatus = SellerStatus.loaded;
      notifyListeners();
      return;
    } catch (e) {
      debugPrint("error in getCollaborators $e");
      collaboratorsState = collaboratorsState.changeToFailed;
      notifyListeners();
      return;
    }
  }

  Future<void> onChangeSelectedSeller({
    InvoiceModel? invoice,
  }) async {
    if (invoice == null) return;

    final sellerType = SellerTypeEnumExtension.fromParam(invoice.type_seller);

    selectedSellerType = sellerType;
    notifyListeners();

    if (selectedSellerType == SellerTypeEnum.employee) return;

    if (selectedSellerType == SellerTypeEnum.collaborator) {
      _handleCollaboratorsState(invoice);
    }

    _handleAgentDistributors(invoice);
  }

  void _handleAgentDistributors(InvoiceModel invoice) {
    final agent = agentDistributorsState.data?.firstWhereOrNull((element) {
      return element.idAgent == invoice.fk_agent &&
          element.typeAgent == SellerTypeEnum.agent.toParam;
    });
    final distributor = agentDistributorsState.data
        ?.firstWhereOrNull((element) => element.idAgent == invoice.fk_agent);

    if (agent != null) {
      selectedSellerType = SellerTypeEnum.agent;
      selectedAgent = agent;
    } else if (distributor != null) {
      selectedSellerType = SellerTypeEnum.distributor;
      selectedDistributor = distributor;
    }
    notifyListeners();
  }

  void _handleCollaboratorsState(InvoiceModel invoice) {
    final participate = collaboratorsState.data?.firstWhereOrNull(
        (element) => element.id_participate == invoice.participate_fk);

    if (participate != null) {
      selectedSellerType = SellerTypeEnum.collaborator;
      selectedCollaborator = participate;
      notifyListeners();
    }
  }

  onChangeSellerType(SellerTypeEnum sellerType) {
    selectedSellerType = sellerType;
    notifyListeners();
  }

  onChangeSelectedCollaborator(ParticipateModel collaborator) {
    selectedCollaborator = collaborator;
    notifyListeners();
  }

  onChangeSelectedAgent(AgentDistributorModel agentDistributorModel) {
    if (selectedSellerType == SellerTypeEnum.agent) {
      selectedAgent = agentDistributorModel;
    } else {
      selectedDistributor = agentDistributorModel;
    }
    notifyListeners();
  }

  resetAdditionalInformation() {
    selectedCollaborator = null;
    selectedAgent = null;
    selectedDistributor = null;
    selectedSellerType = SellerTypeEnum.employee;
    agentDistributorsState = PageState();
    collaboratorsState = PageState();
  }

  List<InvoiceModel> listdeletedFilterSearch = [];

  List<FileAttach> filesAttach = [];

  initAttachFiles(List<FileAttach> filesAttach) {
    this.filesAttach = List.of(filesAttach);
  }

  addOnFilesAttach(List<FileAttach> files, VoidCallback onLimitExceeded) {
    final count = maxFilesAttach - filesAttach.length;
    if (count <= 0) {
      onLimitExceeded();
      return;
    } else {
      final attaches = files.take(count);
      filesAttach.addAll(attaches);
      notifyListeners();
    }
  }

  deleteFileAttach(int index) {
    filesAttach.removeAt(index);
    notifyListeners();
  }

  final int maxFilesAttach = 20;

  bool isLoadingCrudFiles = false;

  Future<InvoiceModel> curdInvoiceFiles({
    required Map<String, dynamic> body,
    required List<XFile> files,
    XFile? file,
    required String invoiceId,
    bool isDeleteFile = false,
    VoidCallback? onSucess,
    required Function(dynamic value) onFail,
  }) async {
    try {
      isLoadingCrudFiles = true;
      notifyListeners();

      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

      final response = await apiServices.postRequestWithFile(
        endPoint: "${EndPoints.invoice.crudFileInvoice}${invoiceId}",
        data: body,
        isDeleteFile: isDeleteFile,
        files: files,
        file: file,
      );

      final data = apiDataHandler(response);
      final invoice = InvoiceModel.fromJson(data);
      currentInvoice = invoice;

      int index = listInvoiceClient
          .indexWhere((element) => element.idInvoice == invoiceId);
      if (index != -1) listInvoiceClient[index] = currentInvoice!;

      index =
          listinvoices.indexWhere((element) => element.idInvoice == invoiceId);
      if (index != -1) listinvoices[index] = currentInvoice!;

      index = listInvoicesAccept
          .indexWhere((element) => element.idInvoice == invoiceId);
      if (index != -1) listInvoicesAccept[index] = currentInvoice!;

      isLoadingCrudFiles = false;
      notifyListeners();

      onSucess?.call();
      return invoice;
    } on BaseAppException catch (e) {
      debugPrint('error in crudFilesInvoice => ' + e.message);
      currentInvoice = await Invoice_Service().getInvoiceByIdInvoice(invoiceId);
      isLoadingCrudFiles = false;
      notifyListeners();
      onFail.call(e.message);
      rethrow;
    } catch (e) {
      debugPrint("error in crudFilesInvoice => $e");
      rethrow;
    }
  }

  void clearProducts() {
    addedProductsInvoice = [];
    deleteProductsInvoice = [];
    editProductsInvoiceRemote = [];
  }
}
