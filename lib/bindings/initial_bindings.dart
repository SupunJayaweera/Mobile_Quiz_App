import 'package:get/get.dart';
import 'package:mobile_quiz_app/controllers/auth_controller.dart';
import 'package:mobile_quiz_app/controllers/theme_controller.dart';
import 'package:mobile_quiz_app/services/firebase_storage_service.dart';

class InitialBindings implements Bindings {
 
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthConatroller(), permanent: true);
    Get.put(FirebaseStorageService()); 
  }

}