var myApp = angular.module("myApp", []);
myApp.controller('myController', ['$scope', function ($scope) {
    $scope.gmail = {
        username: "",
        email: ""
    };
    $scope.onGoogleLogin = function () {
        var params = {
            'clientid': '173984215406-5bv6l7uk6071oii7rfnmabjqk5hmdrhb.apps.googleusercontent.com',
            'cookiepolicy': 'single_host_origin',
            'callback': function (result) {
                if (result['status']['signed_in']) {
                    var request = gapi.client.plus.people.get(
                        {
                            'userId': 'me'
                        }
                    );
                    request.execute(function (resp) {
                        $scope.$apply(function () {
                            $scope.gmail.username = resp.displayName;
                            $scope.gmail.email = resp.emails[0].value;
                            $scope.g_image = resp.image.url;

                            
                        });
                    });
                }
                alert($scope.email.gmail);
            },
            'approvalprompt': 'force',
            'scope': 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'

        };
        gapi.auth.signIn(params);
    }
}]);
