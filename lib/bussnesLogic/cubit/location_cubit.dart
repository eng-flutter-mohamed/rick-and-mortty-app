import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/models/Location.dart';
import '../../data/repository/LocationRepository.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  List<LocationModel> location = [];
  Locationrepository locationrepository;
  LocationCubit({required this.locationrepository}) : super(LocationInitial());
  List<LocationModel> getAllLocation() {
    locationrepository.getAllLocation().then((location) {
      emit(Locationloded(location: location));
      this.location = location;
    });
    return location;
  }
}
