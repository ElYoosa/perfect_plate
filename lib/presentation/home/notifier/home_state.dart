part of 'home_notifier.dart';

class HomeState extends Equatable {
  final TextEditingController? searchController;
  final HomeModel? homeModel;
  final String? searchText;
  final int selectedIndex;
  final String? selectedCategory;

  const HomeState({
    this.searchController,
    this.homeModel,
    this.searchText,
    this.selectedIndex = 0,
    this.selectedCategory,
  });

  @override
  List<Object?> get props => [
        searchController,
        homeModel,
        searchText,
        selectedIndex,
        selectedCategory,
      ];

  HomeState copyWith({
    TextEditingController? searchController,
    HomeModel? homeModel,
    String? searchText,
    int? selectedIndex,
    String? selectedCategory,
  }) {
    return HomeState(
      searchController: searchController ?? this.searchController,
      homeModel: homeModel ?? this.homeModel,
      searchText: searchText ?? this.searchText,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
