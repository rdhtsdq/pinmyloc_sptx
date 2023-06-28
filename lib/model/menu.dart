class Menu {
  final String? title;
  final String? id;
  final List<SubMenu>? submenu;

  Menu({this.title, this.id, this.submenu});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "subMenu": submenu?.map((e) => e.toJson()).toList(),
    };
  }
}

class SubMenu {
  final String? title;
  final String? id;

  SubMenu({this.title, this.id});

  Map<String, dynamic> toJson() => {"id": id, "title": title};
}

final List<Menu> menus = [
  Menu(id: "DASH000", title: "Dashboard"),
  Menu(id: "ABSN000", title: "Absen Kerja", submenu: [
    SubMenu(id: "ABSN001", title: "Absen"),
    SubMenu(id: "ABSN002", title: "Riwayat Absensi")
  ]),
  Menu(id: "SHFT00", title: "Shift", submenu: [
    SubMenu(id: "SHFT001", title: "Jadwal Shift"),
    SubMenu(id: "SHFT002", title: "Riwayat Tukar Shift"),
    SubMenu(id: "SHFT003", title: "Persetujuan Tukar Shift"),
  ]),
  Menu(id: "LMBR000", title: "Lembur", submenu: [
    SubMenu(id: "LMBR001", title: "Lembur"),
    SubMenu(id: "LMBR002", title: "Persetujuan Lembur")
  ]),
  Menu(id: "TSKL000", title: "Target Kerja", submenu: [
    SubMenu(id: "TSKL001", title: "Jadwal"),
    SubMenu(id: "TSKL002", title: "Laporan")
  ]),
  Menu(id: "DNSK000", title: "Dinas Kerja", submenu: [
    SubMenu(id: "DNSK001", title: "Dinas"),
    SubMenu(id: "DNSK002", title: "Persetujuan Dinas")
  ]),
  Menu(id: "IZNK000", title: "Izin Kerja", submenu: [
    SubMenu(id: "IZNK001", title: "Riwayat Izin"),
    SubMenu(id: "IZNK002", title: "Persetujuan Izin"),
  ]),
  Menu(
    id: "EVNT000",
    title: "Libur & Acara",
  ),
  Menu(
    id: "PRFL000",
    title: "Profil",
  )
];
