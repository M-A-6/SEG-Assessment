
    $("#menu-toggle").click(function (e) {
        e.preventDefault();
    $("#wrapper").toggleClass("active");
    });


var appSEG = angular.module('appSEG', ['ngRoute']);

appSEG.config(function ($routeProvider , $locationProvider) {
    $routeProvider.when('/Home', { templateUrl: 'Views/Common/Home/Home.html', contoller : 'HomeController'});
    $routeProvider.when('/Login', { templateUrl: 'Views/Common/Login/Login.html', contoller : 'LoginController' });
    $routeProvider.when('/ManageEmployee', { templateUrl: 'Views/Employee/ManageEmployee/ManageEmployee.html', contoller: 'ManageEmployeeController' });
    $routeProvider.when('/Employees', { templateUrl: 'Views/Employee/Employees/Employees.html', contoller: 'EmployeesController' });
    
    $routeProvider.otherwise({ redirectTo: '/Home' });
    $locationProvider.html5Mode(true);
   
    
});