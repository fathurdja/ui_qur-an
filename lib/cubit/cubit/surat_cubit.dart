import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slicing_uiquran/data/api_request.dart';
import 'package:slicing_uiquran/data/surat_mode.dart';

part 'surat_state.dart';

class SuratCubit extends Cubit<SuratState> {
  SuratCubit() : super(SuratInitial());
  void getSurat() async {
    emit(SuratLoading());
    await getSuratData().then(
      (value) {
        emit(SuratLoaded(value));
      },
    ).catchError((onError) {
      emit(SuratError(onError.toString()));
    });
  }
}
