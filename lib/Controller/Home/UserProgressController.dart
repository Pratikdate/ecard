import 'package:get/get.dart';

class UserProgressController extends GetxController {
  var engagementRate = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEngagementRate();
  }

  void fetchEngagementRate() {
    // Fetch the engagement rate from a data source and update the state
    engagementRate.value = 75.0; // Example value, replace with actual data fetching logic
  }
}
