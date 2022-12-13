import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrcode/layout/cubit/cubit.dart';
import 'package:qrcode/layout/cubit/states.dart';

class BottomNavigationLayout extends StatelessWidget {
  const BottomNavigationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrScanCubit(),
      child: BlocConsumer<QrScanCubit, QrcodeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = QrScanCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                cubit.appBar[cubit.currentIndex],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              centerTitle: true,
            ),
            body: cubit.listOfWidgets[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (v) {
                  cubit.changeIndex(v);
                },
                backgroundColor: Colors.blue,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey[300],
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.create), label: "Create"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.read_more_rounded), label: "Read"),
                ]),
          );
        },
      ),
    );
  }
}
