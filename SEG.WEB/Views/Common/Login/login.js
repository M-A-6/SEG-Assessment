


appSEG.factory('loginService', function ($http) {
    loginObj = {};

    loginObj.getByEmp = function (employee) {
        var Emp;

        Emp = $http({
            method: 'POST', url: 'http://localhost:61158/4228/Login', data: employee
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
    $rootScope.Language
});