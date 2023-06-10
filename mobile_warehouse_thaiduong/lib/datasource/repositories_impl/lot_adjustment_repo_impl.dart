import 'package:mobile_warehouse_thaiduong/datasource/service/lot_adjustment_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/lot_adjustment.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/lot_adjment_repository.dart';

import '../../domain/entities/item_lot.dart';

class LotAjustmentRepoImpl implements LotAdjustmentRepository {
  final LotAdjustmentService lotAdjustmentService;
  LotAjustmentRepoImpl(this.lotAdjustmentService);
  @override
  Future<List<LotAdjustment>> getAllLotAdjustment() {
    final lotAdjust = lotAdjustmentService.getAllLotAdjustment();
    return lotAdjust;
  }

  @override
  Future<ErrorPackage> postNewLotAdjustment(String employeename, LotAdjustment lotAdjustment) {
    final lotAdjust = lotAdjustmentService.postNewLotAdjustment( employeename, lotAdjustment);
    return lotAdjust;
  }
}
