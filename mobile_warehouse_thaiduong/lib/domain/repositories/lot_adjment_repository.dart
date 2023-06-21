import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/lot_adjustment.dart';


abstract class LotAdjustmentRepository {
  Future<ErrorPackage> postNewLotAdjustment( String employeename, LotAdjustment lotAdjustment);
  Future<List<LotAdjustment>> getAllLotAdjustment();
  
}
