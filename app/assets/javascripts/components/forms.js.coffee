# $(document).on "submit", "#project-form", (event) ->
#   event.preventDefault()
#   $form = @


# App
angular.module('forms', [])

# Project Starter Controller
@ProjectController = ($scope) ->
  $scope.submit = ->
    console?.log $scope.projectStarter
    $scope.projectStarter = {}

  $scope.validEmail = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
