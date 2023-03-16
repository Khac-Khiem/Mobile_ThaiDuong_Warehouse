import 'package:mobile_warehouse_thaiduong/datasource/service/lot_adjustment_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/lot_adjustment.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/lot_adjment_repository.dart';

class LotAjustmentRepoImpl implements LotAdjustmentRepository {
  final LotAdjustmentService lotAdjustmentService;
  LotAjustmentRepoImpl(this.lotAdjustmentService);
  @override
  Future<List<LotAdjustment>> getAllLotAdjustment() {
    // TODO: implement getAllLotAdjustment
    throw UnimplementedError();
  }

  @override
  Future<ErrorPackage> postNewLotAdjustment() {
    // TODO: implement postNewLotAdjustment
    throw UnimplementedError();
  }
}
