import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_search_input.dart';
import 'notifier/home_notifier.dart';
import 'widgets/category_item_widget.dart';
import 'widgets/header_section.dart';
import 'widgets/home_bottom_navigation_bar.dart';
import 'widgets/recipe_card_widget.dart';
import 'widgets/upgrade_premium_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const HeaderSection(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSearchBar(context),
                    const UpgradePremiumCard(),
                    _buildCategories(context),
                    _buildPopularRecipes(context),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: HomeBottomNavigationBar(
          onTap: (index) {
            // Handle bottom navigation tap
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
      child: Consumer(
        builder: (context, ref, _) {
          final state = ref.watch(homeNotifier);
          return CustomSearchInput(
            controller: state.searchController,
            hintText: 'Mau Masak Apa Hari ini ....',
            onChanged: (value) {
              ref.read(homeNotifier.notifier).onSearchChanged(value);
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildCategories(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categories', style: TextStyleHelper.instance.title22Bold),
          SizedBox(height: 16.h),
          Consumer(
            builder: (context, ref, _) {
              final categories =
                  ref.watch(homeNotifier).homeModel?.categoryList ?? [];
              return SizedBox(
                height: 100.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => SizedBox(width: 16.h),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryItemWidget(
                      categoryModel: category,
                      onTapCategory: () =>
                          onTapCategory(category.categoryType ?? ''),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPopularRecipes(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular Recipes', style: TextStyleHelper.instance.title22Bold),
          SizedBox(height: 16.h),
          Consumer(
            builder: (context, ref, _) {
              final popularRecipes =
                  ref.watch(homeNotifier).homeModel?.popularRecipesList ?? [];
              final featuredRecipe = ref
                  .watch(homeNotifier)
                  .homeModel
                  ?.featuredRecipe;

              return Column(
                children: [
                  if (featuredRecipe != null)
                    RecipeCardWidget(
                      recipeModel: featuredRecipe,
                      onTapRecipe: () =>
                          onTapRecipe(featuredRecipe.recipeId ?? ''),
                    ),
                  SizedBox(height: 16.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: popularRecipes.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final recipe = popularRecipes[index];
                      return RecipeCardWidget(
                        recipeModel: recipe,
                        isSmallCard: true,
                        onTapRecipe: () => onTapRecipe(recipe.recipeId ?? ''),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  /// Handles category selection
  void onTapCategory(String category) {
    // Handle category navigation
  }

  /// Handles recipe selection
  void onTapRecipe(String recipeId) {
    // Handle recipe navigation
  }
}
