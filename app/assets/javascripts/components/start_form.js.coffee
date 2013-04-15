# App
app = angular.module('starter-form', [])


# Project Starter Controller
@ProjectController = ($scope) ->
  $scope.submit = ->
    $scope.model = {}

  $scope.validEmail = /([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/i

  $scope.suggestEmail = ->
    Kicksend.mailcheck.run
      email: $scope.model.email
      suggested: (suggestion) ->
        $scope.emailSuggestion = suggestion.full
      empty: ->
        $scope.emailSuggestion = null

  $scope.useSuggestion = ($event) ->
    $event.preventDefault()
    if $scope.emailSuggestion?
      $scope.model.email = $scope.emailSuggestion
      $scope.emailSuggestion = null
