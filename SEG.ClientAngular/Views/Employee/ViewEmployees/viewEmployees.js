appSEG.factory('viewEmployeesService', function ($http) {
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

appSEG.controller('ViewEmployeesCtrl', ['$scope', '$compile', '$http', 'DTOptionsBuilder', 'DTColumnBuilder',
    function ($scope, $compile, $http, DTOptionsBuilder, DTColumnBuilder, viewEmployeesService, $route) {
        var vm = this;
        vm.message = '';
        vm.edit = edit;        
        vm.delete = deleteRow;
        vm.dtInstance = {};
        vm.persons = {};
        vm.dtInstance = {};
        vm.reloadData = reloadData;
        $scope.dtColumns = [            
            DTColumnBuilder.newColumn(null).withTitle('Actions').notSortable()
                .renderWith(function (data, type, full, meta) {
                    return '<button class="btn btn-mini btn-warning" ng-click="editEmployee('+ data.EmployeeId + ')"></button>';
                }),
            DTColumnBuilder.newColumn("EmployeeId", "Employee ID"),
            DTColumnBuilder.newColumn("FirstName", "First Name"),
            DTColumnBuilder.newColumn("LastName", "Last Name"),
            DTColumnBuilder.newColumn("Email", "Email"),
            DTColumnBuilder.newColumn(null).withTitle('Actions').notSortable()                 
                .renderWith(actionsHtml)
                
        ]

        $scope.dtOptions = DTOptionsBuilder.newOptions().withOption('ajax', {
            url: "http://localhost:4228/api/Employee",
            type: "GET",
           
        })
            .withPaginationType('full_numbers')
            .withOption('createdRow', createdRow)
            .withDisplayLength(10);


        function edit(person) {
            console.log(person);
            $scope.Msg = 'You are trying to edit the row: ' + JSON.stringify(person);
            // Edi/t some data and call server to make changes...
            // Then reload the data so that DT is refreshed
             vm.dtInstance.reloadData();
        }

        $scope.editEmployee =function (person) {
            console.log(person);
            $scope.Msg = 'You are trying to edit the row: ' + JSON.stringify(person);
            // Edi/t some data and call server to make changes...
            // Then reload the data so that DT is refreshed
             vm.dtInstance.reloadData();
        }
        $scope.deleteEmployee = function (empId) {
            console.log(empId);
            $scope.Msg = 'You are trying to edit the row: ' + JSON.stringify(empId);
            // Edit some data and call server to make changes...
            // Then reload the data so that DT is refreshed
            //vm.dtInstance.reloadData();
            $http({ method: 'Delete', url: 'http://localhost:4228/api/Employee', params: { id: empId } }).
                then(function (response) {
                    $scope.Msg = response.data;                   
                });
        }
        function deleteRow(person) {
            $scope.Msg = 'You are trying to remove the row: ' + JSON.stringify(person);
            // Delete some data and call server to make changes...
            // Then reload the data so that DT is refreshed
            vm.dtInstance.reloadData();
        }

        function createdRow(row, data, dataIndex) {
            // Recompiling so we can bind Angular directive to the DT
            $compile(angular.element(row).contents())($scope);
        }

        function reloadData() {
            var resetPaging = false;
            vm.dtInstance.reloadData(callback, resetPaging);
        }

        function callback(json) {
            console.log(json);
        }

        function actionsHtml(data, type, full, meta) {
           // console.log(data);
            vm.persons[data.EmployeeId] = data;
            return '<button class="btn btn-mini btn-danger" ng-click="deleteEmployee('+ data.EmployeeId + ')">' +
                '   <i class="glyphicon glyphicon-minus-sign"></i>' +
                '</button>';

            //<a class="btn btn-mini btn-warning" ng-click="edit(' + data + ')">' +
            //            '   <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>

            //'<p class="btn btn-mini btn-danger" ng-click="deleteEmployee(' + data + ')">' +
            //    '   <i class="glyphicon glyphicon-minus-sign" aria-hidden="true"></i>' +
            //    '</a>'


        }

        $scope.DeleteEmployee = function (empId) {
           // if ($window.confirm("Do you want to delete Employee with Id:" + empId + "?")) {
                viewEmployeesService.deleteEmployeeById(empId).then(function (result) {
                if (result.ModelState == null) {
                    $scope.Msg = " You have successfully deleted " + result.EmployeeId;
                    $scope.Flg = true;
                }
                else {
                    $scope.Msg = result.ModelState;
                }
            });
        //}
    };

    }]);