import 'package:mobile_warehouse_thaiduong/datasource/models/error_package_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/lot_adjustment_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constant.dart';
import '../../domain/entities/item_lot.dart';

class LotAdjustmentService {
  Future<ErrorPackageModel> postNewLotAdjustment(
      ItemLot itemLot, String employeename, String newPO, String note, double newQuantity) async {
    final res =
        await http.post(Uri.parse('${Constants.baseUrl}api/LotAdjustments'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': '*/*',
            },
            body: jsonEncode(
              <String, dynamic>{
                "lotId": itemLot.lotId.toString(),
                "itemId": itemLot.item!.itemId.toString(),
                "beforeQuantity": double.tryParse(itemLot.quantity.toString()),
                "afterQuantity": double.tryParse(newQuantity.toString()),
                "oldPurchaseOrderNumber": itemLot.purchaseOrderNumber.toString(),
                "newPurchaseOrderNumber": newPO.toString(),
                "unit": itemLot.item!.unit.toString(),
                "employeeName": "Trần Như Toàn",
                "note": note.toString()
              },
            ));
    if (res.statusCode == 200) {
      return ErrorPackageModel(
        "success",
      );
    } else {
     return ErrorPackageModel(
        "fail",
      );
    }
  }

  Future<List<LotAdjustmentModel>> getAllLotAdjustment() async {
    final res = await http.get(
      Uri.parse('${Constants.baseUrl}/api/LotAdjustments'),
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      //   print(body.toString());
      List<LotAdjustmentModel> lot =
          body.map((e) => LotAdjustmentModel.fromJson(e)).toList();
      return lot;
    } else {
      return throw "Unable to retrieve posts.";
    }
  }
}
