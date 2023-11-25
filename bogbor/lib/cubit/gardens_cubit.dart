import 'package:bloc/bloc.dart';
import 'package:bogbor/models/garden.dart';

part 'gardens_state.dart';

class GardensCubit extends Cubit<GardensState> {
  GardensCubit()
      : super(
          GardensState(
            gardens: [],
          ),
        );
}
