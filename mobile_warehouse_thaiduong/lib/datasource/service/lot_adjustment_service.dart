import 'package:mobile_warehouse_thaiduong/datasource/models/error_package_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/lot_adjustment_model.dart';

class LotAdjustmentService {
  // Future<ErrorPackageModel> postNewLotAdjustment() async {
  //   return ErrorPackageModel('success');
  // }
  Future<ErrorPackageModel> postNewLotAdjustment(
    double afterQuantity, String newPurchaseOrderNumber, String notes)async {
    return ErrorPackageModel(
      "success",
    );
  }
  Future<List<LotAdjustmentModel>> getAllLotAdjustment() async {
    return [];
  }
}
