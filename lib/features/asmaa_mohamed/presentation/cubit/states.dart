import 'package:islamic_app/features/asma_allah/data/models/asmaa_allah_model.dart';


class MohamedNamesStates {}

class InitialMohamedNamesState extends MohamedNamesStates {}

class LoadingMohamedNamesState extends MohamedNamesStates {}

class SuccessMohamedNamesState extends MohamedNamesStates {
  final List<AsmaaModel> names;

  SuccessMohamedNamesState(this.names);
}

class ErrorMohamedNamesState extends MohamedNamesStates {
  final String message;

  ErrorMohamedNamesState(this.message);
}
