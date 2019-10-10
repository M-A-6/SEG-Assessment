
appSEG.factory('manageEmployeeService', function ($http) {
    empMgmtObj = {};
    empMgmtObj.getAll = function () {
        var Emps;

        Emps = $http({ method: 'Get', url: 'http://localhost:4228/api/Employee' }).
            then(function (response) {
                return response.data;

            });

        return Emps;
    };
    empMgmtObj.createEmployee = function (emp) {
        var Emp;

        Emp = $http({ method: 'Post', url: 'http://localhost:4228/api/Employee', data: emp }).
            then(function (response) {

                return response.data;

            }, function (error) {
                return error.data;
            });

        return Emp;
    };    
    return empMgmtObj;
});



appSEG.controller('ManageEmployeeController', function ($scope, manageEmployeeService, $window, $rootScope) {  
   

    $scope.CreateEmployee = function (Emp, IsValid) {
        console.log(Emp);
        console.log(IsValid);

        if (IsValid) {          
            manageEmployeeService.createEmployee(Emp).then(function (result) {
                if (result.ModelState == null) {
                    $scope.Msg = " You have successfully created " + result.EmployeeId;
                    $scope.Flg = true;

                    $scope.Emp = {}; // clears input fields
                  
                }
                else {
                    $scope.serverErrorMsgs = result.ModelState;
                }
            });
        };
    };
});