import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

class CustomBottomSheet extends StatelessWidget {
  String? bankAccountName;
  String? bankIban;
  String? descriptionNo;

  CustomBottomSheet({
    Key? key,
    this.bankAccountName,
    this.bankIban,
    this.descriptionNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50.w,
              height: 3.h,
              decoration: const BoxDecoration(
                color: Color(0xFF141C2D),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          SizedBox(height: 25.h),
          Text(
            "Hesap Adı",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 5.h),
          _buildContainer(context, bankAccountName!),
          SizedBox(height: 10.h),
          Text(
            "IBAN",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 5.h),
          _buildContainer(context, bankIban!),
          SizedBox(height: 10.h),
          Text(
            "Açıklama",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 5.h),
          _buildContainer(context, descriptionNo!),
          SizedBox(height: 15.h),
          Container(
            padding: EdgeInsets.all(16.w),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xFFF3F4F6),
            ),
            child: Text(
              "Lütfen havale yaparken açıklama alanına yukarıdaki kodu yazmayı unutmayın.",
              style: TextStyle(color: const Color(0xFFBCC2CE), fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            padding: EdgeInsets.all(16.w),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xFFFFF6F6),
            ),
            child: Text(
              "Eksik bilgi girilmesi sebebiyle tutarın askıda kalması durumunda, ücret kesintisi yapılacaktır.",
              style: TextStyle(color: const Color(0xFFF64949), fontSize: 12.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildContainer(BuildContext context, String text) {
    ToastContext().init(context);
    return Container(
        padding: EdgeInsets.only(left: 16.w),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xFFF3F4F6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            IconButton(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: text));
                  Toast.show(
                    'Panoya Kopyalandı',
                  );
                },
                icon: Icon(
                  Icons.copy,
                  size: 16.sp,
                  color: const Color(0xFF66CC78),
                )),
          ],
        ));
  }
}
