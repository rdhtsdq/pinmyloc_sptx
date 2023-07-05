import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:frontend/view/path.dart';
import '../constant/colors.dart';
import '../constant/text.dart';
import '../constant/text_style.dart';
import '../controller/any/any.dart';
import '../model/view_setting.dart';
import '../model/menu.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final key = GlobalKey<ScaffoldState>();

  setView(String id, String title) {
    Navigator.pop(context);
    context.read<ViewCubit>().setView(Menu(id: id, title: title));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewSettingCubit, ViewSetting>(
      builder: (context, state) {
        return BlocBuilder<ViewCubit, Menu>(
          builder: (context, view) {
            return Scaffold(
              key: key,
              backgroundColor: MyColor.base,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: AppBar(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: MyColor.base,
                  actions: [
                    IconButton(
                      onPressed: () {
                        key.currentState?.openEndDrawer();
                      },
                      icon: const Icon(
                        Icons.menu_rounded,
                        size: 26,
                      ),
                    )
                  ],
                  title: Text(
                    view.title ?? '',
                    style: const TextStyle(
                        fontSize: MyTextStyle.subTitle1,
                        fontWeight: MyTextStyle.bold),
                  ),
                ),
              ),
              body: Padding(
                padding:
                    state.padding ?? const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: View.views[view.id] ?? Container(),
              ),
              floatingActionButton: state.isHead
                  ? ExpandableFab(
                      children: state.children ?? [],
                      backgroundColor: MyColor.primary,
                      child: state.fabChild ?? const SizedBox(),
                      type: ExpandableFabType.up,
                      distance: 70,
                    )
                  : state.fabAction != null
                      ? state.fabChild is Text
                          ? FloatingActionButton.extended(
                              onPressed: () => state.fabAction?.call(),
                              label: state.fabChild ?? const Text(""),
                              backgroundColor: MyColor.primary,
                            )
                          : FloatingActionButton(
                              onPressed: () => state.fabAction?.call(),
                              backgroundColor: MyColor.primary,
                              child: state.fabChild,
                            )
                      : null,
              floatingActionButtonLocation:
                  state.isHead ? ExpandableFab.location : null,
              endDrawer: Drawer(
                surfaceTintColor: MyColor.base,
                backgroundColor: MyColor.base,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            MyText.appName,
                            style: TextStyle(
                                fontSize: MyTextStyle.subTitle1,
                                fontWeight: MyTextStyle.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ...menus.map((e) {
                            if (e.submenu != null && e.submenu!.isNotEmpty) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  dividerColor: Colors.transparent,
                                ),
                                child: ExpansionTile(
                                  title: Text(
                                    e.title ?? '',
                                    style: const TextStyle(
                                        fontWeight: MyTextStyle.bold),
                                  ),
                                  children: e.submenu!
                                      .map(
                                        (s) => Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: ListTile(
                                            onTap: () => setView(
                                                s.id ?? "", s.title ?? ''),
                                            title: Text(s.title ?? ""),
                                            dense: true,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            } else {
                              return ListTile(
                                onTap: () => setView(e.id ?? "", e.title ?? ''),
                                title: Text(
                                  e.title ?? "",
                                  style: const TextStyle(
                                      fontWeight: MyTextStyle.bold),
                                ),
                              );
                            }
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
