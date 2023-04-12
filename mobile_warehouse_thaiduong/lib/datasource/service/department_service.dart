import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_warehouse_thaiduong/datasource/models/department_model.dart';

class DepartmentService {
  Future<List<DepartmentModel>> getDepartments() async {
    //  final url = Uri.parse(
    //     'https://chaauthenticationdelegateservice.azurewebsites.net/api/login');
    // final response = await http.get(url,

    //   );
    // if (response.statusCode == 200) {
    //   List<dynamic> body = jsonDecode(response.body);
    //   List<DepartmentModel> items = body
    //       .map(
    //         (dynamic item) => DepartmentModel.fromJson(item),
    //       )
    //       .toList();
    //   return items;
    // } else {
    //   throw "Unable to retrieve posts.";
    // }
    return [DepartmentModel('Sản xuất'),DepartmentModel('Đóng gói'), DepartmentModel('QC')];
  }
}
