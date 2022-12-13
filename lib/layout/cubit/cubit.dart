import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrcode/layout/cubit/states.dart';
import 'package:qrcode/modules/createscan.dart';
import 'package:qrcode/modules/readscan.dart';

class QrScanCubit extends Cubit<QrcodeStates> {
  QrScanCubit() : super(QrcodeInitialState());
  static QrScanCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<String> appBar = ["Create Scan", "Read Scan"];
  List<Widget> listOfWidgets = [const CreateScan(), const ReadScan()];
  void changeIndex(int v) {
    currentIndex = v;
    emit(QrcodeChangeState());
  }

  String barcode = "Scan The Qr code";
  String barcodeScan = "Scan The Qr code";

  void createBarCode(String code) {
    barcode = code;
    emit(QrcodeCreateState());
  }

  void scanQrCode() {
    FlutterBarcodeScanner.scanBarcode("#2A99CF", "Cancel", true, ScanMode.QR)
        .then((value) {
      barcodeScan = value;
      emit(QrcodeScanState());
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
