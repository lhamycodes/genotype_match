
import '../locator.dart';

import '../services/navigation_service.dart';

import '../ui/views/app/dashboard.dart';

import '../viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    Future.delayed(Duration(seconds: 5), () async {
      _navigationService.navigateToDashboard(DashboardScreen());
    });
  }
}
