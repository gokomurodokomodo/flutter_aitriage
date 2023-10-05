import 'package:flutter_aitriage/aitriage_module_assessment/data/repository/note_repository.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/data/repository/patient_repository.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/add_patient_note_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/delete_note_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/edit_note_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_gender_type_param_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_list_patient_note_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/update_patient_uc.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/patient_detail/patient_detail_controller.dart';
import 'package:get/get.dart';
import '../../domain/use_case/delete_patient_uc.dart';
import '../../domain/use_case/get_patient_detail_uc.dart';

class PatientDetailBinding extends Bindings {
  final dynamic argument;

  PatientDetailBinding(this.argument);

  @override
  void dependencies() {
    Get.lazyPut(() => PatientRepositoryImpl());
    Get.lazyPut(() => NoteRepositoryImpl());
    Get.lazyPut(() => GetPatientDetailUseCaseImpl(Get.find<PatientRepositoryImpl>()));
    Get.lazyPut(() => GetGenderParamUseCaseImpl());
    Get.lazyPut(() => UpdatePatientUseCaseImpl(Get.find<PatientRepositoryImpl>()));
    Get.lazyPut(() => DeletePatientUseCaseImpl(Get.find<PatientRepositoryImpl>()));
    Get.lazyPut(() => GetListPatientNoteUseCaseImpl(Get.find<NoteRepositoryImpl>()));
    Get.lazyPut(() => AddPatientNoteUseCaseImpl(Get.find<NoteRepositoryImpl>()));
    Get.lazyPut(() => EditNoteUseCaseImpl(Get.find<NoteRepositoryImpl>()));
    Get.lazyPut(() => DeleteNoteUseCaseImpl(Get.find<NoteRepositoryImpl>()));
    Get.lazyPut(() => PatientDetailController(
        argument,
        Get.find<GetPatientDetailUseCaseImpl>(),
        Get.find<GetGenderParamUseCaseImpl>(),
        Get.find<UpdatePatientUseCaseImpl>(),
        Get.find<DeletePatientUseCaseImpl>(),
        Get.find<GetListPatientNoteUseCaseImpl>(),
        Get.find<AddPatientNoteUseCaseImpl>(),
        Get.find<EditNoteUseCaseImpl>(),
        Get.find<DeleteNoteUseCaseImpl>()
    ));
  }
}