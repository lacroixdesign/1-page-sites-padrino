##
# App
# 
app = angular.module('starter-form', ['lacroix.forms'])


##
# Project Starter Controller
# 
@ProjectController = ["$scope", "$http", "$element", ($scope, $http, $element) ->

  $scope.submit = ->
    event.preventDefault()

    if $scope.projectStarter.$invalid
      $scope.projectStarter.name.$dirty = true
      $scope.projectStarter.email.$dirty = true
      return false

    $scope.sending = true
    $form = $(event.target)
    url   = $form.attr("action")
    data = $.param({ model: $scope.model })

    success = (data, status, headers, config) ->
      $scope.sent = true
    error = (data, status, headers, config) ->
      $scope.sending = false
    req = $http({method: "POST", url: url, data: data})
      .success(success)
      .error(error)

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
]
