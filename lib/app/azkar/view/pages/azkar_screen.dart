import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_habit_tracker/core/constants.dart';
import 'package:islamic_habit_tracker/core/navigation/routes.dart';
import 'package:islamic_habit_tracker/app/azkar/data/models/azkar_category.dart';
import 'package:islamic_habit_tracker/app/azkar/data/repo/azkar_service.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';
import 'package:islamic_habit_tracker/app/azkar/view/widgets/azkar_category_tile.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

enum ViewType { list, grid }

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  bool loading = false;
  List<ZikrCategory> zikrCategories = [];
  List<ZikrCategory> searchedZikrCategories = [];
  ViewType _viewType = ViewType.list;
  int _crossAxisCount = 1;
  double _aspectRatio = 3.8;
  bool isSearchTextFieldVisible = false;
  @override
  void initState() {
    loading = true;
    _initializeAzkarCategories().then(
      (value) {
        setState(() {
          zikrCategories = value;
        });
      },
    );
    super.initState();
  }

  ///get Azkar List from JSON file
  Future<List<ZikrCategory>> _initializeAzkarCategories() async {
    final List<ZikrCategory> futureZirCategories;
    futureZirCategories = await AzkarService().loadZikrCategories();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        loading = false;
      });
    });
    return futureZirCategories;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      opacity: 0.6,
      inAsyncCall: loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPageHeader(context),
                _showSearchField(size, context),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _crossAxisCount,
                    childAspectRatio: _aspectRatio,
                  ),
                  itemCount: searchedZikrCategories.isEmpty
                      ? zikrCategories.length
                      : searchedZikrCategories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.goNamed(AppRoutes.azkarDetailsScreen,
                            extra: zikrCategories[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: AzkarCategoryTile(
                          zikrCategory: searchedZikrCategories.isEmpty
                              ? zikrCategories[index]
                              : searchedZikrCategories[index],
                          tileColor: searchedZikrCategories.isEmpty
                              ? azkarColors[index]
                              : azkarColors[
                                  searchedZikrCategories[index].id - 1],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showSearchField(Size size, BuildContext context) {
    return Visibility(
      visible: isSearchTextFieldVisible,
      child: SizedBox(
        height: size.height * 0.07,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
          child: TextField(
            onChanged: (value) {
              searchedZikrCategories = _searchForCategory(value);
              setState(() {});
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text(S.of(context).searchZikr),
                prefixIcon: IconButton(
                  onPressed: () {
                    isSearchTextFieldVisible = false;
                    setState(() {});
                  },
                  icon: const Icon(Icons.cancel),
                )),
          ),
        ),
      ),
    );
  }

  Row _buildPageHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            isSearchTextFieldVisible = true;
            setState(() {});
          },
          icon: const Icon(Icons.search),
        ),
        Text(
          S.of(context).Azkar,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        IconButton(
            onPressed: () async {
              if (_viewType == ViewType.list) {
                _viewType = ViewType.grid;
                _crossAxisCount = 2;
                _aspectRatio = 2;
              } else {
                _viewType = ViewType.list;
                _crossAxisCount = 1;
                _aspectRatio = 3.8;
              }

              setState(() {});
            },
            icon: _viewType == ViewType.list
                ? const Icon(Icons.grid_on)
                : const Icon(Icons.list)),
      ],
    );
  }

  List<ZikrCategory> _searchForCategory(String userInput) {
    final searchedCategories = zikrCategories
        .where((zikrCategory) => zikrCategory.category.contains(userInput))
        .toList();
    return searchedCategories;
  }
}
