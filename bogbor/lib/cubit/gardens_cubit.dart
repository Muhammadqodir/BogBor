import 'package:bloc/bloc.dart';
import 'package:bogbor/api.dart';
import 'package:bogbor/models/garden.dart';

part 'gardens_state.dart';

class GardensCubit extends Cubit<GardensState> {
  GardensCubit()
      : super(
          GardensState(
            gardens: [],
          ),
        );

  void update() async {
    print("update");
    List<Garden> gardens = await Api().getGardens();
    emit(GardensState(gardens: gardens));
  }
}
