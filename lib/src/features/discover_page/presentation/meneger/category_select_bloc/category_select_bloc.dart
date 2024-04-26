import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:poll_dao/src/features/discover_page/data/models/data_cetegory_model.dart';
import 'package:poll_dao/src/features/discover_page/domain/repositories/repository.dart';
import 'package:poll_dao/src/features/widget_servers/status/status.dart';
import 'package:poll_dao/src/features/widget_servers/universal_data/universaldata.dart';

part 'category_select_event.dart';
part 'category_select_state.dart';

class CategorySelectBloc extends Bloc<CategorySelectEvent, CategorySelectState> {
  final DiscoverRepository discoverRepository;
  CategorySelectBloc({required this.discoverRepository}) : super(const CategorySelectState()) {
    on<CategorySelectEventFetchData>(_fetchData);
  }
  _fetchData(CategorySelectEventFetchData event, Emitter<CategorySelectState> emit) async {
    emit(state.copyWith(statusText: "loading", formStats: FormStatus.loading));
    final UniversalData universalData = await discoverRepository.fetchData();
    emit(state.copyWith(
        statusText: "success....",
        dataCategoryModel: universalData.data,
        formStats: FormStatus.success));
    }
}
