import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:inner_spark_app/theme.dart';
import 'package:inner_spark_app/widgets/radio_tile.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  int? _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          'main.store.title'.tr(),
          style: textTheme.titleLarge!.copyWith(
            color: colorScheme.primary,
            fontSize: 30.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text('main.store.categories_title'.tr()),
        const SizedBox(height: 8.0),
        _buildCategories(),
        const SizedBox(height: 16.0),
        Image.asset('assets/images/banner.png'),
        const SizedBox(height: 16.0),
        Text('main.store.hot_selling_title'.tr(), style: textTheme.titleMedium),
        const SizedBox(height: 8.0),
        _buildHotSelling(textTheme),
        const SizedBox(height: 16.0),
        Text('main.store.recommends_title'.tr(), style: textTheme.titleMedium),
        const SizedBox(height: 8.0),
        _buildRecommended(textTheme)
      ],
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 86.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategory(
            0,
            Icons.checkroom,
            'main.store.categories.0'.tr(),
          ),
          _buildCategory(
            1,
            Icons.directions_walk,
            'main.store.categories.1'.tr(),
          ),
          _buildCategory(
            2,
            Icons.hiking,
            'main.store.categories.2'.tr(),
          ),
          _buildCategory(
            3,
            Icons.fitness_center,
            'main.store.categories.3'.tr(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(int index, IconData icon, String name) {
    return SizedBox(
      width: 120.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: RadioTile(
          value: index,
          groupValue: _selectedCategory,
          onChanged: _onCategoryChanged,
          addRadio: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 32.0),
                const SizedBox(height: 4.0),
                Text(name, textAlign: TextAlign.center)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHotSelling(TextTheme textTheme) {
    return SizedBox(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildItem(
            'assets/images/items/item_0.png',
            'main.store.items.0'.tr(),
            '\$50',
            '20% OFF',
            textTheme.bodySmall!,
          ),
          _buildItem(
            'assets/images/items/item_1.png',
            'main.store.items.1'.tr(),
            '\$50',
            '30% OFF',
            textTheme.bodySmall!,
          ),
          _buildItem(
            'assets/images/items/item_2.png',
            'main.store.items.2'.tr(),
            '\$100',
            '20% OFF',
            textTheme.bodySmall!,
          ),
        ],
      ),
    );
  }

  Widget _buildRecommended(TextTheme textTheme) {
    return SizedBox(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildItem(
            'assets/images/items/item_3.png',
            'main.store.items.3'.tr(),
            '\$38',
            '20% OFF',
            textTheme.bodySmall!,
          ),
          _buildItem(
            'assets/images/items/item_4.png',
            'main.store.items.4'.tr(),
            '\$35',
            '15% OFF',
            textTheme.bodySmall!,
          ),
          _buildItem(
            'assets/images/items/item_5.png',
            'main.store.items.5'.tr(),
            '\$50',
            '30% OFF',
            textTheme.bodySmall!,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    String image,
    String title,
    String price,
    String? discount,
    TextStyle textStyle,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        width: 110.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            Text(title, style: textStyle),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '$price ', style: textStyle),
                  if (discount != null)
                    TextSpan(
                      text: discount,
                      style: textStyle.copyWith(color: primaryColor),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCategoryChanged(int? index) {
    setState(() {
      _selectedCategory = index;
    });
  }
}
