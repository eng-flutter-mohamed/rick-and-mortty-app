part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}
class Locationloded extends LocationState {
   final List<LocationModel> location;
   Locationloded({required this.location});
}
