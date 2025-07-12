import '../../../core/app_export.dart';

/// This class is used in the [recipe_card_widget] widget.

// ignore_for_file: must_be_immutable
class RecipeModel extends Equatable {
  RecipeModel({
    this.recipeId,
    this.recipeName,
    this.recipeImage,
    this.videoCount,
    this.isFavorite,
    this.isFeatured,
  }) {
    recipeId = recipeId ?? "";
    recipeName = recipeName ?? "";
    recipeImage = recipeImage ?? "";
    videoCount = videoCount ?? "";
    isFavorite = isFavorite ?? false;
    isFeatured = isFeatured ?? false;
  }

  String? recipeId;
  String? recipeName;
  String? recipeImage;
  String? videoCount;
  bool? isFavorite;
  bool? isFeatured;

  RecipeModel copyWith({
    String? recipeId,
    String? recipeName,
    String? recipeImage,
    String? videoCount,
    bool? isFavorite,
    bool? isFeatured,
  }) {
    return RecipeModel(
      recipeId: recipeId ?? this.recipeId,
      recipeName: recipeName ?? this.recipeName,
      recipeImage: recipeImage ?? this.recipeImage,
      videoCount: videoCount ?? this.videoCount,
      isFavorite: isFavorite ?? this.isFavorite,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }

  @override
  List<Object?> get props => [
        recipeId,
        recipeName,
        recipeImage,
        videoCount,
        isFavorite,
        isFeatured,
      ];
}
