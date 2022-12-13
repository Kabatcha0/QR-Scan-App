import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrcode/layout/cubit/cubit.dart';
import 'package:qrcode/layout/cubit/states.dart';

class CreateScan extends StatelessWidget {
  const CreateScan({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrScanCubit, QrcodeStates>(
        builder: (context, state) {
          var cubit = QrScanCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BarcodeWidget(
                    data: cubit.barcode,
                    color: Colors.blue,
                    height: 250,
                    width: 250,
                    barcode: Barcode.qrCode()),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusColor: Colors.blue,
                      hintText: "Enter your Text",
                      hintStyle: const TextStyle(color: Colors.blue),
                      suffixIcon: const Icon(
                        Icons.qr_code,
                        color: Colors.blue,
                      )),
                  onChanged: (v) {
                    cubit.createBarCode(v);
                  },
                )
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
