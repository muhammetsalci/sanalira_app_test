import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankListScreen extends StatefulWidget {
  const BankListScreen({super.key});

  @override
  State<BankListScreen> createState() => _BankListScreenState();
}

class _BankListScreenState extends State<BankListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF3F4F6),
        elevation: 0,
        leading: GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            padding: const EdgeInsets.only(left: 8, right: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
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
          Padding(
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
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
                  title: Text("Türk Lirası"),
                  subtitle:
                      Text("TL", style: Theme.of(context).textTheme.bodyText2),
                  trailing: Text(
                    "234 ₺",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Türk lirası yatırmak için banka seçiniz.",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: 3,
      ),
    );
  }
}
