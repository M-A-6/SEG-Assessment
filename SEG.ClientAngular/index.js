
$("#menu-toggle").click(function (e) {
    e.preventDefault();
    $("#wrapper").toggleClass("active");
});

'$scope', '$compile'

var appSEG = angular.module('appSEG', ['ngRoute', 'ngCookies', 'datatables']);

appSEG.run(function ($rootScope, $cookies, $http) {
    if ($cookies.get("Auth") == null) {
        $cookies.put("Auth", "false");
    }

    $rootScope.Auth = $cookies.get("Auth");
    $http.defaults.headers.common['my_Token'] = "123456789";
});

//appSEG.factory('myHttpInterceptor', function ($q, $window) {
//    return {
//        response: function (response) {
//            return response;
//        },
//        responseError: function (response) {
//            if (response.status == 500) {
//                $window.alert(response.statusText);
//            }
//            return $q.reject(response);
//        }
//    };
//});

appSEG.config(function ($routeProvider, $locationProvider) {
    $routeProvider.when('/Home', { templateUrl: 'Views/Common/Home/Home.html', contoller: 'HomeController' });
    $routeProvider.when('/Login', { templateUrl: 'Views/Common/Login/Login.html', controller: 'loginController' }); 
    $routeProvider.when('/Register', { templateUrl: 'Views/Common/Register/Register.html', contoller: 'registerController' });
    $routeProvider.when('/CreateEmployee', { templateUrl: 'Views/Employee/CreateEmployee/CreateEmployee.html', contoller: 'createEmployeeController' });
    $routeProvider.when('/ViewEmployees', { templateUrl: 'Views/Employee/ViewEmployees/ViewEmployees.html', contoller: 'ViewEmployeesCtrl' });

    $routeProvider.otherwise({ redirectTo: '/Home' });
    $locationProvider.html5Mode(true);


});


