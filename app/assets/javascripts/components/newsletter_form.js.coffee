##
# App
# 
newsletterForm = angular.module 'NewsletterForm', ['lacroix.forms']


##
# Project Starter Controller
# 
newsletterForm.controller "NewsletterController", ["$scope", "$element", "submitForm", "suggestEmail", "useSuggestion", "emailRegex", ($scope, $element, submitForm, suggestEmail, useSuggestion, emailRegex) ->

  $scope.submit = ->
    event.preventDefault()
    if $scope.newsletterForm.$invalid
      $scope.newsletterForm.email.$dirty = true
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
angular.bootstrap '#newsletter-form', ['NewsletterForm']
