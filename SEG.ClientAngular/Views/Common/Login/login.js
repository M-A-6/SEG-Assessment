appSEG.factory('loginService', function ($http) {
    loginObj = {};

    loginObj.getByEmp = function (employee) {
        var Emp;

        employee["grant_type"] = 'password';

        console.log(employee);

        Emp = $http({
            method: 'POST', url: 'http://localhost:4228/token', data: employee
        }).
            then(function (response) {
                console.log(response);
                return response;
            }, function (error) {
                console.log(error);
                return error;
            });

        return Emp;
    };

    return loginObj;
});

appSEG.controller('loginController', function ($scope, loginService, $cookies, $rootScope, $location) {
    $scope.Login = function (emp, IsValid) {
        if (IsValid) {
            loginService.getByEmp(emp).then(function (result) {

                //if (result.status == 500)
                //{
                //    $scope.serverErrorMsgs = [{"0":result.data.ExceptionMessage}];
                //}
                //else
                if (result.status == 200) {

                    $scope.Emp = result.data;
                    $scope.errorMsgs = "";

                    $cookies.put("Auth", "true");
                    $rootScope.Auth = $cookies.get(result.access_token);


                    $cookies.put("EmpSignIn", JSON.stringify($scope.Emp));
                    $rootScope.EmpSignIn = JSON.parse($cookies.get("EmpSignIn"));

                    console.log($rootScope.EmpSignIn);

                    $location.path('/');
                }
                else {
                    $scope.serverErrorMsgs = result.data.ModelState;
                }
            }, function (error) {
                console.log(error);
            });
        }
    }
});