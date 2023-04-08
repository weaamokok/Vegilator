import 'package:vegilator/src/domain/models/reponses/vegetable_response.dart';
import 'package:vegilator/src/domain/models/requests/vegetable_request.dart';

import '../../utils/resources/data_state.dart';

abstract class ApiRepository {
  Future<DataState<VegetablesResponse>> getVegetables(
      {required VegetablesRequest request});
}
