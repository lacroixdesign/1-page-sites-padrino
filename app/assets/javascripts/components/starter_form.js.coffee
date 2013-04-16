##
# App
# 
starterForm = angular.module('StarterForm', ['lacroix.forms'])


##
# Project Starter Controller
# 
starterForm.controller "ProjectController", ["$scope", "$element", "submitForm", "suggestEmail", "useSuggestion", "emailRegex", ($scope, $element, submitForm, suggestEmail, useSuggestion, emailRegex) ->

  $scope.submit = ->
    event.preventDefault()
    if $scope.startForm.$invalid
      $scope.startForm.name.$dirty = true
      $scope.startForm.email.$dirty = true
      return false
    submitForm(event, $scope)

  $scope.validEmail = emailRegex()

  $scope.suggestEmail = ->
    suggestEmail($scope)

  $scope.useSuggestion = ($event) ->
    $event.preventDefault()
    useSuggestion($scope)
]


##
# Init App
# 
angular.bootstrap '#starter-form', ['StarterForm']
