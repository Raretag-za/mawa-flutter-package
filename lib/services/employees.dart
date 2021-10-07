part of mawa;

class Employees {

  static const String employeesResource = 'employees';
  late List employees;
  getAllEmployees() async{
    List emps = await NetworkRequests().securedMawaAPI(
        NetworkRequests.methodGet,
        resource: '$employeesResource/');
    Map<String, String> mapUsers = {};
    if (emps != null) {
      for (int i = 0; i < emps.length; i++) {
        emps[i][JsonResponseKeys.usersFirstName] != null &&
                emps[i][JsonResponseKeys.usersFirstName] != null
            ? mapUsers['${emps[i][JsonResponseKeys.usersId]}'] =
                '${emps[i][JsonResponseKeys.usersLastName] ?? 'Surname not Supplied'}, ${emps[i][JsonResponseKeys.usersFirstName] ?? 'Name not Supplied'}' //'${listUsers[i][JsonKeys.usersLastName]}, ${listUsers[i][JsonKeys.usersFirstName]}'
            : mapUsers['${emps[i][JsonResponseKeys.usersId]}'] = 'No Name Provided';
      }
    }
    employees = emps;
  }

  getEmployee(String employeeId) async {
    return NetworkRequests().securedMawaAPI(NetworkRequests.methodGet,
        resource: '$employeesResource/$employeeId');
  }
}