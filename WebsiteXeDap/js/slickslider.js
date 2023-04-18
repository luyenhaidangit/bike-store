// app.directive('slickSlider', function () {
//   return {
//     restrict: 'A',
//     scope: { data: '=' },
//     link: function (scope, element, attrs) {
//       var isInitialized = false;
//       scope.$watch('data', function (newVal, oldVal) {
//         if (newVal && newVal.length > 0 && !isInitialized) {
//           $(element).slick(scope.$eval(attrs.slickSlider));
//           isInitialized = true;
//         }
//       });
//     }
//   };
// });

var app = angular.module('app', []);
app.controller('ListBike', function($scope) {
  $scope.currentIndex = 0;

  $scope.setCurrentSlideIndex = function(index) {
    $scope.currentIndex = index;
  };

  $scope.isCurrentSlideIndex = function(index) {
    return $scope.currentIndex === index;
  };

  $scope.prevSlide = function() {
    $scope.currentIndex = ($scope.currentIndex > 0) ? --$scope.currentIndex : $scope.slides.length - 1;
  };

  $scope.nextSlide = function() {
    $scope.currentIndex = ($scope.currentIndex < $scope.slides.length - 1) ? ++$scope.currentIndex : 0;
  };
});

