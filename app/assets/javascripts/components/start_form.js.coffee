##
# App
# 
app = angular.module('starter-form', ['lacroix.forms'])


##
# Project Starter Controller
# 
app.controller "ProjectController", ["$scope", "$element", "submitForm", "suggestEmail", "useSuggestion", ($scope, $element, submitForm, suggestEmail, useSuggestion) ->

  $scope.submit = ->
    event.preventDefault()
    if $scope.projectStarter.$invalid
      $scope.projectStarter.name.$dirty = true
      $scope.projectStarter.email.$dirty = true
      return false
    submitForm(event, $scope)

  $scope.validEmail = /([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/i

  $scope.suggestEmail = ->
    suggestEmail($scope)

  $scope.useSuggestion = ($event) ->
    $event.preventDefault()
    useSuggestion($scope)
]
