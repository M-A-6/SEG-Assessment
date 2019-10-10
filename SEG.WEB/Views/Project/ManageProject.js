appERP.factory('ProjectService', function ($http) {
    ProjectsObj = {};
    ProjectsObj.getAll = function () {
        var Projects;
        Projects = $http({
            method: 'Get',
            url: 'http://localhost:5622/api/project'
        }).then(function (response) {
            return response.data;
            });

        return Projects;
    };

    return ProjectsObj;
});

appERP.controller('ManageProjectController', function ($scope,ProjectService) {
    $scope.msg = "Welcome to mange project";

    ProjectService.getAll().then(function (result) {
        $scope.Projects = result;
    });
});