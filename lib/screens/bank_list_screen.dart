import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sanalira_flutter_test/model/bank_model.dart';
import 'package:sanalira_flutter_test/services/bank_services.dart';
import 'package:sanalira_flutter_test/widgets/custom_bottom_sheet_widget.dart';

class BankListScreen extends StatefulWidget {
  const BankListScreen({super.key});

  @override
  State<BankListScreen> createState() => _BankListScreenState();
}

class _BankListScreenState extends State<BankListScreen> {
  final storage = const FlutterSecureStorage();
  bool isLoading = true;
  final BankService _service = BankService();
  List<Data>? bankalar = [];
  @override
  void initState() {
    super.initState();
    _service.fetchBanks().then((value) {
      setState(() {
        if (value.data != null) {
          bankalar = value.data;
          isLoading = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF3F4F6),
        elevation: 0,
        leading: GestureDetector(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, top: 8.h, bottom: 8.h),
            child: Container(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            ),
          ),
          onTap: () async {
            //storage.deleteAll();
            exit(0);
          },
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, top: 8.h, bottom: 8.h),
              child: Container(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
              ),
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, top: 8.h, bottom: 8.h),
              child: Container(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBakiye(context),
            SizedBox(height: 10.h),
            Text(
              "Türk lirası yatırmak için banka seçiniz.",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 10.h),
            _buildBankList()
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Padding _buildBakiye(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        padding: EdgeInsets.only(left: 8.w, right: 8.w),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListTile(
          leading: Image.asset(
            "assets/flags/tr.png",
            width: 48.w,
          ),
          title: const Text("Türk Lirası"),
          subtitle: Text("TL", style: Theme.of(context).textTheme.bodyText2),
          trailing: Text(
            "234 ₺",
            style:
                Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Expanded _buildBankList() {
    return Expanded(
      child: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: bankalar?.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: ListTile(
                    leading: SizedBox(
                      width: 78.w,
                      height: 60.h,
                      child: Center(
                        child: Image.asset(
                          "assets/banka_icon/$index.png",
                          scale: 4,
                        ),
                      ),
                    ),
                    title: Text(
                      bankalar![index].bankName.toString(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: const Color(0xFF141C2D),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp),
                    ),
                    subtitle: Text("Havale / EFT ile para gönderin.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 12)),
                    onTap: () {
                      showBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          backgroundColor: Colors.white,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: CustomBottomSheet(
                                bankAccountName:
                                    bankalar![index].bankAccountName,
                                bankIban: bankalar![index].bankIban,
                                descriptionNo: bankalar![index].descriptionNo,
                              ),
                            );
                          });
                    },
                  ),
                );
              },
            ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigation_bar_icon/hut.png",
              scale: 4,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigation_bar_icon/transaction.png",
              scale: 4,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(15.0.w),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: Image.asset(
                "assets/navigation_bar_icon/main_menu_icon.png",
                scale: 3,
              ),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigation_bar_icon/card.png",
              scale: 4,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/navigation_bar_icon/user.png",
              scale: 4,
            ),
            label: ""),
      ],
    );
  }
}
