part of 'category_select_bloc.dart';

@immutable
class CategorySelectState extends Equatable{
  final String? statusText ;
  final DataCategoryModel? dataCategoryModel;
  final FormStatus? formStats;
  const CategorySelectState({this.statusText, this.dataCategoryModel, this.formStats=FormStatus.pure});

  CategorySelectState copyWith({String? statusText, DataCategoryModel? dataCategoryModel, FormStatus? formStats}) {
    return CategorySelectState(
        statusText: statusText ?? this.statusText,
        dataCategoryModel: dataCategoryModel ?? this.dataCategoryModel,
        formStats: formStats ?? this.formStats
    );
  }
  @override
  List<Object?> get props => [
    statusText,
    dataCategoryModel,
    formStats
  ];
}


