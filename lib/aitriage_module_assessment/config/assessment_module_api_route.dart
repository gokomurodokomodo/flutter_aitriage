class AssessmentModuleApiRoute {
  AssessmentModuleApiRoute._();

  static const getNationality = '/setting/v1/country/all';
  static const addPatient = '/main/v1/customer/account/%s/create';
  static const getAllPatient = '/main/v1/customer/account/%s/list';
  static const getPatientDetail = '/main/v1/customer/account/%s/detail';
  static const updatePatient = '/main/v1/customer/account/%s/update';
  static const deletePatient = '/main/v1/customer/account/%s/delete';
  static const getListPatientNote = '/main/v1/note/list';
  static const addPatientNote = '/main/v1/note/create';
  static const deleteNote = '/main/v1/note/delete';
  static const editNote = '/main/v1/note/edit';
  static const getListAssessment = '/main/v1/assessment/list';
}