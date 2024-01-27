import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:iqraa_w_irtaqi/services/api_service.dart';
import 'package:iqraa_w_irtaqi/services/connectivity_service.dart';
import 'package:iqraa_w_irtaqi/services/token_service.dart';
import 'package:iqraa_w_irtaqi/services/validation_service.dart';
import 'package:iqraa_w_irtaqi/ui/views/navbar/home/home_view.dart';
import 'package:iqraa_w_irtaqi/ui/views/splash/splash_view.dart';

@StackedApp(
  dependencies: [
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: ConnectivityService),
    LazySingleton(classType: TokenService),
    LazySingleton(classType: ValidationService),
  ],
  routes: [
    MaterialRoute(
      page: SplashView,
      name: 'splashView',
      initial: true,
    ),
    MaterialRoute(
      page: HomeView,
      name: 'homeView',
    ),
  ],
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}