import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sephora_flutter/service/rest_api_service.dart';
import '../encryptionDB/encryption_db.dart';
import 'connectivity_service.dart';

final locator = GetIt.instance;
bool configured = false;

Future<void> setupDependencies() async {
  if (!configured) {
    WidgetsFlutterBinding.ensureInitialized();

    //Internet connectivity
    var connectivityService = await ConnectivityService.getInstance();
    await connectivityService.initialise();
    locator.registerSingleton(connectivityService);

    //Api Calling
    var restApiService = await RestApiService.getInstance();
    await restApiService.initialise(connectivityService);
    locator.registerSingleton(restApiService);

    // stores:--------------------------------------------------------------------
    //Local Storage
    var sharedPrefService = await SharedPrefServices.getInstance();
    await sharedPrefService.initialise();
    locator.registerSingleton<SharedPrefServices>(sharedPrefService);
  }
}
