import 'package:flutter/material.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';

import '../../../constant.dart';
import '../../widgets/button_widget.dart';

class UpdateIsolationItemScreen extends StatelessWidget {
  const UpdateIsolationItemScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.mainColor,
        leading: IconButton(
          icon: const Icon(Icons.west_outlined),
          onPressed: () {
            Navigator.pushNamed(context, '/isolation_function_screen');
          },
        ),
        title: Text(
          'Danh sách hàng hóa',
          style: TextStyle(fontSize: 22 * SizeConfig.ratioFont),
        ),
      ),
      body: Column(children: [
        Text(
          overflow: TextOverflow.ellipsis,
          "Danh sách hàng đang cách ly",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20 * SizeConfig.ratioFont,
            color: Colors.black,
          ),
        ),
        // BlocConsumer<IsolationBloc, IsolationState>(
        //     listener: (context, state) {},
        //     builder: (context, state) {
        //       if (state is GetAllIsolationLotSuccessState) {
        //return
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Divider(
                indent: 30,
                endIndent: 30,
                color: Constants.mainColor,
                thickness: 1,
              ),
              SizedBox(
                height: 470 * SizeConfig.ratioHeight,
                child: ListView.builder(
                    //itemCount: state.itemLot.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 350 * SizeConfig.ratioWidth,
                          height: 70 * SizeConfig.ratioHeight,
                          color: Constants.buttonColor,
                        ),
                      );
                    }),
              ),
              // CustomizedButton(text: "Truy xuất", onPressed: () {})
            ],
          ),
        ),
        // } else {
        //   return const Center(child: CircularProgressIndicator());
        // }
        // }),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 500, 10, 10),
          child: CustomizedButton(
              text: "Trở lại",
              onPressed: () {
                Navigator.pushNamed(context, '/isolation_function_screen');
              }),
        )
      ]),
    );
  }
}
