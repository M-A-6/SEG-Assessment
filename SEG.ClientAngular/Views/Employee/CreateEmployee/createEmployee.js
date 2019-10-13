
appSEG.factory('createEmployeeService', function ($http) {
    empMgmtObj = {};

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

appSEG.controller('createEmployeeController', function ($scope, createEmployeeService, $window, $rootScope) {
    $scope.CreateEmployee = function (Emp, IsValid) {
        console.log(Emp);
        console.log(IsValid);

        if (IsValid) {
            createEmployeeService.createEmployee(Emp).then(function (result) {
                console.log(result);
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