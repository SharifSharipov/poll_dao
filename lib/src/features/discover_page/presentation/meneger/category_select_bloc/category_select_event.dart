part of 'category_select_bloc.dart';

@immutable
sealed class CategorySelectEvent {}

class CategorySelectEventFetchData extends CategorySelectEvent {}
class CategorySelectEventSelectData extends CategorySelectEvent {}
class CategorySelectEventSelectDataError extends CategorySelectEvent {}
class CategorySelectEventSelectDataSuccess extends CategorySelectEvent {}
