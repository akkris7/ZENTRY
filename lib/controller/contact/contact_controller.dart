import 'package:get/get.dart';
import 'package:zentry/model/model/add_contact_model.dart';
import 'package:zentry/model/response/contact_response.dart';
import 'package:zentry/service/api_helper.dart';



class ContactController extends GetxController{
  var records = <ContactRecords>[].obs;
  List<ContactRecords>? products = [];
  var filteredProducts = <ContactRecords>[].obs;
  var countAll = 0.obs;
  var isLading = false.obs;

  ContactListResponse? contactListResponse;
  saveContact (ContactRequestModel request) async{
    isLading.value = true;
    dynamic response = await APIHelper().addContact(request);
    bool result = response["isSuccess"];
    if (result){
      print(result);
    }
    isLading.value = false;
  }

  getContact () async {
    isLading.value = true;
    ContactListResponse? response;

    try {
      response = await APIHelper().getContact();
      print(response?.records);
    } catch (e) {
      print('Error occurred while fetching contact: $e');
    }

    isLading.value = false;
    return response;
  }

}