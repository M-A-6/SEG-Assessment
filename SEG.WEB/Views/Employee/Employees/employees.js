
 $(document).ready(function () {
    $('#employeetable').dataTable();
});
    
appSEG.factory('employeesService', function ($http) {
        empMgmtObj = {};

        empMgmtObj.getAll = function () {
            var Emps;

            Emps = $http({ method: 'Get', url: 'http://localhost:4228/api/Employee' }).
                then(function (response) {
                    return response.data;

                });

            return Emps;
        };
    

        empMgmtObj.deleteEmployeeById = function (eid) {
            var Emps;

            Emps = $http({ method: 'Delete', url: 'http://localhost:4228/api/Employee', params: { id: eid } }).
                then(function (response) {
                    return response.data;

                });

            return Emps;
        };


        return empMgmtObj;
    });



appSEG.controller('EmployeesController', function ($scope, employeesService, $window) {
   
    employeesService.getAll().then(function (result) {
        $scope.Emps = result;
    });
        
    
    $scope.DeleteEmployeeById = function (Emp) {
        if ($window.confirm("Do you want to delete Employee with Id:" + Emp.EmployeeId + "?")) {
            employeesService.deleteEmployeeById(Emp.EmployeeId).then(function (result) {
                if (result.ModelState == null) {
                    $scope.Msg = " You have successfully deleted " + result.EmployeeId;
                    $scope.Flg = true;

                    employeesService.getAll().then(function (result) {
                        $scope.Emps = result;
                    });
                }
                else {
                    $scope.serverErrorMsgs = result.ModelState;
                }
            });
        }
    };
});