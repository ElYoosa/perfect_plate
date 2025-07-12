import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/category_item_model.dart';
import '../models/home_model.dart';
import '../models/recipe_model.dart';

part 'home_state.dart';

final homeNotifier = StateNotifierProvider.autoDispose<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(HomeState(homeModel: HomeModel())),
);

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(super.state) {
    initialize();
  }

  void initialize() {
    TextEditingController searchController = TextEditingController();

    List<CategoryItemModel> categoryList = [
      CategoryItemModel(
        categoryIcon: ImageConstant.imgCocktail31265881,
        categoryName: 'Drink',
        categoryType: 'drink',
        backgroundColor: appTheme.colorFFFFF8,
      ),
      CategoryItemModel(
        categoryIcon: ImageConstant.imgPlatter114778921,
        categoryName: 'Main Course',
        categoryType: 'main-course',
        backgroundColor: appTheme.colorFFFEDD,
      ),
      CategoryItemModel(
        categoryIcon: ImageConstant.imgCupcake1743941,
        categoryName: 'Dessert',
        categoryType: 'dessert',
        backgroundColor: appTheme.colorFFFFF8,
      ),
      CategoryItemModel(
        categoryIcon: ImageConstant.imgCategory39045521,
        categoryName: 'More',
        categoryType: 'more',
        backgroundColor: appTheme.colorFFFFF8,
      ),
    ];

    RecipeModel featuredRecipe = RecipeModel(
      recipeId: 'rendang',
      recipeName: 'Rendang',
      recipeImage: ImageConstant.imgDagingSapi1,
      videoCount: '10 Video',
      isFeatured: true,
    );

    List<RecipeModel> popularRecipesList = [
      RecipeModel(
        recipeId: 'ayam-kecap',
        recipeName: 'Ayam Kecap',
        recipeImage: ImageConstant.imgAyam1,
        isFavorite: false,
      ),
      RecipeModel(
        recipeId: 'ikan-bakar',
        recipeName: 'Ikan Bakar',
        recipeImage: ImageConstant.imgIkan1,
        isFavorite: false,
      ),
    ];

    HomeModel homeModel = HomeModel(
      userName: 'Hi, Dita Shakira',
      categoryList: categoryList,
      featuredRecipe: featuredRecipe,
      popularRecipesList: popularRecipesList,
    );

    state = state.copyWith(
      searchController: searchController,
      homeModel: homeModel,
      selectedIndex: 0,
    );
  }

  void onSearchChanged(String searchText) {
    state = state.copyWith(searchText: searchText);
  }

  void onBottomNavTap(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  void selectCategory(String categoryType) {
    state = state.copyWith(selectedCategory: categoryType);
  }

  void toggleRecipeFavorite(String recipeId) {
    List<RecipeModel>? updatedPopularRecipes = state
        .homeModel
        ?.popularRecipesList
        ?.map((recipe) {
          if (recipe.recipeId == recipeId) {
            return recipe.copyWith(isFavorite: !(recipe.isFavorite ?? false));
          }
          return recipe;
        })
        .toList();

    HomeModel? updatedHomeModel = state.homeModel?.copyWith(
      popularRecipesList: updatedPopularRecipes,
    );

    state = state.copyWith(homeModel: updatedHomeModel);
  }
}
