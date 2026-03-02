import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/local/shared_pref.dart';
import '../../data/services/location_service.dart';



abstract class LocationState {}

class LocationInitial extends LocationState {}
class LocationLoading extends LocationState {}
class LocationSuccess extends LocationState {
  final double lat;
  final double lng;

  LocationSuccess(this.lat, this.lng);
}
class LocationError extends LocationState {
  final String message;
  LocationError(this.message);
}

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<void> getAndSaveLocation() async {
    emit(LocationLoading());

    try {
      final position = await LocationService.getCurrentLocation();

      SharedPref.saveLocation(
        position.latitude,
        position.longitude,
      );

      emit(LocationSuccess(
        position.latitude,
        position.longitude,
      ));

    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }
}