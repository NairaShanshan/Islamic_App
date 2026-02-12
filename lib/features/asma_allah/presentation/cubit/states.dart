import 'package:islamic_app/features/asma_allah/data/models/asmaa_allah_model.dart';

class AsmaaAllahStates {}

class InitialAsmaaAllahState extends AsmaaAllahStates {}

class LoadingAsmaaAllahState extends AsmaaAllahStates {}

class SuccessAsmaaAllahState extends AsmaaAllahStates {
  final List<AsmaaModel> names;

  SuccessAsmaaAllahState(this.names);
}

class ErrorAsmaaAllahState extends AsmaaAllahStates {
  final String message;

  ErrorAsmaaAllahState(this.message);
}
