import 'package:islamic_app/features/azkar/data/models/azkar_model.dart';

class AzkarStates {}

class InitialAzkarState extends AzkarStates {}

class LoadingAzkarState extends AzkarStates {}

class LoadedAzkarState extends AzkarStates {
  final Map<String , List<AzkarModel>> azkarByCategory;

  LoadedAzkarState({required this.azkarByCategory});
}

class ErrorAzkarState extends AzkarStates {
  final String message;

  ErrorAzkarState({required this.message});
}
