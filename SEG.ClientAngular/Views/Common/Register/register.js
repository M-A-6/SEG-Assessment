appSEG.factory('registerService', function ($http) {
    registerObj = {};

    registerObj.createRegister = function (registration) {
        var Emp;

        Emp = $http({ method: 'Post', url: 'http://localhost:4228/api/Employee', data: registration }).
            then(function (response) {
                return response.data;
            }, function (error) {
                return error.data;
            });

        return Emp;
    };

    return registerObj;
});

appSEG.controller('RegisterController', function ($scope, registerService, $location) {
    $scope.CreateRegistration = function (registration, IsValid) {
        console.log(registration);
        console.log(IsValid);

        if (IsValid) {
            registerService.createRegister(registration).then(function (result) {
                console.log(result);
                if (result.ModelState == null) {
                    $scope.Msg = " You have successfully created " + result;
                    $scope.Flg = true;
                    $scope.Reg = {}; // clears input fields
                }
                else {
                    $scope.serverErrorMsgs = result.ModelState;
                }
            });
        };
    };
});