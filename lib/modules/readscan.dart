import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrcode/layout/cubit/cubit.dart';
import 'package:qrcode/layout/cubit/states.dart';

class ReadScan extends StatelessWidget {
  const ReadScan({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrScanCubit, QrcodeStates>(
        builder: (context, state) {
          var cubit = QrScanCubit.get(context);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cubit.barcodeScan,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)),
                      child: MaterialButton(
                        onPressed: () {
                          cubit.scanQrCode();
                        },
                        child: const Text(
                          "Scan",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
    ;
  }
}
