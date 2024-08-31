import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_habit_tracker/core/constants.dart';
import 'package:islamic_habit_tracker/core/navigation/routes.dart';
import 'package:islamic_habit_tracker/features/azkar/data/models/azkar_category.dart';
import 'package:islamic_habit_tracker/features/azkar/data/repo/azkar_service.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';
import 'package:islamic_habit_tracker/features/azkar/view/widgets/azkar_category_tile.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

///***=============================================================
/// This page was supporting animations from listView to gridView
/// but the is a strange confliction between search field and animtion
/// it's unreasonable conflict **LEAVING THE CODE AS REFERENCE**
/// ****************************************************************/
enum ViewType { list, grid }

class DeprecatedAzkarScreen extends StatefulWidget {
  const DeprecatedAzkarScreen({Key? key}) : super(key: key);

  @override
  State<DeprecatedAzkarScreen> createState() => _DeprecatedAzkarScreenState();
}

class _DeprecatedAzkarScreenState extends State<DeprecatedAzkarScreen> {
  bool loading = false;
  List<ZikrCategory> zikrCategories = [];
  List<ZikrCategory> searchedZikrCategories = [];
  ViewType _viewType = ViewType.list;
  int vericalAnimationValue = 0;
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 3.8,
                  ),
                  itemCount: searchedZikrCategories.isEmpty
                      ? zikrCategories.length
                      : searchedZikrCategories.length,
                  itemBuilder: (context, index) {
                    int gridIndex = zikrCategories[index].id;

                    ///? this equation for calcualting the vericalAnimationValue of each tile as it increase with increaseing of their number
                    if (_viewType == ViewType.grid) {
                      (gridIndex + 2) % 2 == 0
                          ? vericalAnimationValue += 102
                          : 0;
                    }
                    if (_viewType == ViewType.list) vericalAnimationValue = 0;
                    return InkWell(
                      onTap: () {
                        context.goNamed(AppRoutes.azkarDetailsScreen,
                            extra: zikrCategories[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            AnimatedPositioned(
                              width: _viewType == ViewType.list
                                  ? (size.width - 20)
                                  : (size.width - 35) / 2,
                              height: size.height * 0.09,
                              bottom:
                                  _viewType == ViewType.grid && gridIndex != 1
                                      ? vericalAnimationValue.toDouble()
                                      : 0,
                              right: _viewType == ViewType.grid &&
                                      gridIndex % 2 == 0
                                  ? 180
                                  : 0,
                              duration: const Duration(seconds: 2),
                              curve: Curves.easeInOut,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: AzkarCategoryTile(
                                  zikrCategory: searchedZikrCategories.isEmpty
                                      ? zikrCategories[index]
                                      : searchedZikrCategories[index],
                                  tileColor: azkarColors[gridIndex - 1],
                                ),
                              ),
                            ),
                          ],
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
    return SizedBox(
      height: size.height * 0.07,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
        child: TextField(
          onChanged: (value) {
            searchedZikrCategories = _SearchForCategory(value);
          },
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: Text(S.of(context).searchZikr),
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              )),
        ),
      ),
    );
  }

  Row _buildPageHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Text(
          S.of(context).Azkar,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        IconButton(
            onPressed: () async {
              if (_viewType == ViewType.list) {
                _viewType = ViewType.grid;
              } else {
                _viewType = ViewType.list;
              }

              setState(() {});
            },
            icon: _viewType == ViewType.list
                ? const Icon(Icons.grid_on)
                : const Icon(Icons.list)),
      ],
    );
  }

  List<ZikrCategory> _SearchForCategory(String userInput) {
    final searchedCategories = zikrCategories
        .where((zikrCategory) => zikrCategory.category.contains(userInput))
        .toList();
    return searchedCategories;
  }
}
