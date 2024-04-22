import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'image_text_edition_controller_state.dart';
class ImageTextEditionControllerCubit extends Cubit<ImageTextEditionControllerState> {
  ImageTextEditionControllerCubit() : super(ImageTextEditionControllerInitial());
  Future<void>addTextFiled({required int index, required TextEditingController controllers})async{
    emit(ImageTextEditionControllerLoading());
    List<TextEditingController> controllers = [];
    int newIndex = index + 1;
    controllers.insert(newIndex,TextEditingController());
    emit(ImageTextEditionControllerLoaded(index: newIndex, controllers: controllers[newIndex]));
    emit(ImageTextEditionControllerSuccess());
  }

  Future<void> deleteTextField({required int index, required TextEditingController controllers}) async {
    emit(ImageTextEditionControllerLoading());
    List<TextEditingController> controllers = [

    ];
    controllers.removeAt(index);
    int newIndex = index > 0 ? index - 1 : 0;
    emit(ImageTextEditionControllerLoaded(index: newIndex, controllers: controllers[index]));
    emit(ImageTextEditionControllerSuccess());
  }

}
