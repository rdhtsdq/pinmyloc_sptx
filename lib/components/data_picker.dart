import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../components/bottom_sheet.dart';
import '../../components/bottom_sheet_top.dart';
import '../../components/card.dart';
import '../../components/search.dart';
import '../../constant/colors.dart';
import '../../constant/size.dart';
import '../../constant/text_style.dart';

class DataPicker {
  static void getEmp(BuildContext context) {
    MyBottomSheet(context).showFullSheet(
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomSheetTop(),
            Text("Pilih Pegawai",
                style: TextStyle(
                    fontSize: MyTextStyle.subTitle2,
                    fontWeight: MyTextStyle.semiBold)),
            const SizedBox(
              height: 20,
            ),
            Search(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  dense: true,
                  title: Text("Emp ${index + 1}"),
                  onTap: () {},
                ),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // static void getMoreEmp(
  //     BuildContext context, ValueChanged<List<PegawaiModel>>? onChanged) {
  //   PegawaiBloc pegawaiBloc = BlocProvider.of<PegawaiBloc>(context);
  //   pegawaiBloc.add(GetPegawai());
  //   late List<PegawaiModel> data;
  //   late List<PegawaiModel> selected;

  //   final theme = Theme.of(context);
  //   final oldCheckboxTheme = theme.checkboxTheme;

  //   final newCheckBoxTheme = oldCheckboxTheme.copyWith(
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(MySize.checkRadius)),
  //   );

  //   return MyBottomSheet(context).showFullSheet(
  //     Padding(
  //       padding: const EdgeInsets.all(15.0),
  //       child: BlocBuilder<PegawaiBloc, PegawaiState>(
  //         builder: (context, state) {
  //           if (state is PegawaiLoaded) {
  //             data = state.pegawai;
  //             selected = List.filled(data.length, PegawaiModel());
  //           }

  //           return StatefulBuilder(
  //             builder: (context, setState) => Stack(
  //               children: [
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: state is PegawaiLoading
  //                       ? [
  //                           const BottomSheetTop(),
  //                           const Text("Pilih Pegawai"),
  //                           const SizedBox(
  //                             height: 20,
  //                           ),
  //                           Search(),
  //                           Center(
  //                             child: Text("Tunggu"),
  //                           )
  //                         ]
  //                       : state is PegawaiLoaded
  //                           ? [
  //                               const BottomSheetTop(),
  //                               const Text("Pilih Pegawai",
  //                                   style: TextStyle(
  //                                       fontSize: MyTextStyle.subTitle2,
  //                                       fontWeight: MyTextStyle.semiBold)),
  //                               const SizedBox(
  //                                 height: 20,
  //                               ),
  //                               Search(),
  //                               Expanded(
  //                                 child: ListView.builder(
  //                                   itemBuilder: (context, index) => Theme(
  //                                     data: Theme.of(context).copyWith(
  //                                         checkboxTheme: newCheckBoxTheme),
  //                                     child: CheckboxListTile(
  //                                       value: selected[index] == data[index],
  //                                       onChanged: (value) {
  //                                         if (value!) {
  //                                           selected[index] = data[index];
  //                                           // selected.add(data[index]);
  //                                         } else {
  //                                           selected[index] = PegawaiModel();
  //                                           // selected.remove(data[index]);
  //                                         }
  //                                         setState(() {});
  //                                       },
  //                                       dense: true,
  //                                       controlAffinity:
  //                                           ListTileControlAffinity.leading,
  //                                       title: Text(data[index].nama ?? ""),
  //                                     ),
  //                                   ),
  //                                   itemCount: data.length,
  //                                 ),
  //                               ),
  //                             ]
  //                           : state is PegawaiError
  //                               ? [
  //                                   const BottomSheetTop(),
  //                                   const Text("Pilih Pegawai"),
  //                                   const SizedBox(
  //                                     height: 20,
  //                                   ),
  //                                   Search(),
  //                                   Text(state.message),
  //                                 ]
  //                               : [],
  //                 ),
  //                 Align(
  //                   alignment: Alignment.bottomRight,
  //                   child: GestureDetector(
  //                     onTap: () {
  //                       var trueValue = selected
  //                           .takeWhile((value) =>
  //                               (value.id != "" || value.nama != "") &&
  //                               (value.id != null || value.nama != null))
  //                           .toList();
  //                       onChanged!.call(trueValue);
  //                       Navigator.pop(context);
  //                     },
  //                     child: MyCard(
  //                       padding: const EdgeInsets.symmetric(
  //                           horizontal: 15, vertical: 8),
  //                       color: MyColor.primary,
  //                       child: Text(
  //                         "Pilih",
  //                         style: TextStyle(
  //                           color: MyColor.base,
  //                           fontSize: MyTextStyle.subTitle3,
  //                           fontWeight: MyTextStyle.semiBold,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  // static void getLocation(
  //     BuildContext context, ValueChanged<LokasiModel>? onChanged) {
  //   LokasiBloc lokasiBloc = BlocProvider.of<LokasiBloc>(context);
  //   lokasiBloc.add(GetLokasi());

  //   late List<LokasiModel> data;

  //   return MyBottomSheet(context).showFullSheet(
  //     StatefulBuilder(
  //       builder: (context, setState) => BlocBuilder<LokasiBloc, LokasiState>(
  //         builder: (context, state) {
  //           if (state is LokasiLoaded) {
  //             data = state.data;
  //           }

  //           return Padding(
  //             padding: const EdgeInsets.all(15.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 const BottomSheetTop(),
  //                 const Text(
  //                   "Pilih Lokasi",
  //                   style: TextStyle(
  //                       fontSize: MyTextStyle.subTitle2,
  //                       fontWeight: MyTextStyle.semiBold),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 Search(),
  //                 if (state is LokasiLoading)
  //                   Center(
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text("Tunggu"),
  //                         LoadingAnimationWidget.prograssiveDots(
  //                             color: MyColor.primary, size: 40)
  //                       ],
  //                     ),
  //                   ),
  //                 if (state is LokasiLoaded)
  //                   Expanded(
  //                     child: ListView.builder(
  //                       itemBuilder: (context, index) => ListTile(
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                           onChanged!.call(data[index]);
  //                         },
  //                         dense: true,
  //                         title: Text(data[index].name ?? "tidak diketahui"),
  //                       ),
  //                       itemCount: data.length,
  //                     ),
  //                   ),
  //                 if (state is LokasiError)
  //                   Center(
  //                     child: Text(state.message),
  //                   ),
  //               ],
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
}
