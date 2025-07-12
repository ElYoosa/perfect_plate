import '../../../core/app_export.dart';
import 'category_item_model.dart';
import 'recipe_model.dart';

/// This class is used in the [home_screen] screen.

// ignore_for_file: must_be_immutable
class HomeModel extends Equatable {
  HomeModel({
    this.userName,
    this.categoryList,
    this.featuredRecipe,
    this.popularRecipesList,
  }) {
    userName = userName ?? "Hi, Dita Shakira";
    categoryList = categoryList ?? [];
    popularRecipesList = popularRecipesList ?? [];
  }

  String? userName;
  List<CategoryItemModel>? categoryList;
  RecipeModel? featuredRecipe;
  List<RecipeModel>? popularRecipesList;

  HomeModel copyWith({
    String? userName,
    List<CategoryItemModel>? categoryList,
    RecipeModel? featuredRecipe,
    List<RecipeModel>? popularRecipesList,
  }) {
    return HomeModel(
      userName: userName ?? this.userName,
      categoryList: categoryList ?? this.categoryList,
      featuredRecipe: featuredRecipe ?? this.featuredRecipe,
      popularRecipesList: popularRecipesList ?? this.popularRecipesList,
    );
  }

  @override
  List<Object?> get props => [
    userName,
    categoryList,
    featuredRecipe,
    popularRecipesList,
  ];
}
