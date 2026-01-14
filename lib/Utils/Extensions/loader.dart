// import 'package:get/get.dart';
// import '../../Widgets/custom_loader_widget.dart';
//
// mixin Loader on GetxController {
//   RxBool get loading => _loading;
//   RxBool _loading = false.obs;
//   setLoading(bool val) {
//     _loading.value = val;
//     print("true----${_loading.value}");
//     update();
//     if (_loading.value) {
//       Get.dialog(CustomLoadingWidget(
//         isLoading: _loading.value,
//       ));
//       print("true----${_loading.value}");
//     } else {
//       print("false----${_loading.value}");
//
//       Get.back();
//       CustomLoadingWidget(
//         isLoading: _loading.value,
//       );
//     }
//   }
// }
