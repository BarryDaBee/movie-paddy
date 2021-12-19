import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'base_view_state.dart';

class BaseViewCubit extends Cubit<BaseViewState> {
  BaseViewCubit() : super(const BaseViewState(currentIndex: 0));

  void setIndex(int index) => emit(BaseViewState(currentIndex: index));
}
