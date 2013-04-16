##
# App
# 
app = angular.module('starter-form', [])

app.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  $httpProvider.defaults.headers.post['Content-Type']   = 'application/x-www-form-urlencoded'
]


##
# jQuery Show/Hide
# 
app.directive "jqShow", ["$timeout", ($timeout) ->
  result =
    restrict: "A"
    link: (scope, element, attrs) ->
      # configure options
      passedOptions = scope.$eval(attrs.jqOptions)
      
      # defaults
      options =
        type: "fade" # or "slide"
        duration: 200
        delay: 0 
        hideImmediately: false # if true, will hide without effects or duration
        callback: null 

      $.extend(options, passedOptions)
      type = options.type
      duration = options.duration
      callback = options.callback
      delay = options.delay
      hideImmediately = options.hideImmediately
 
      # watch the trigger
      jqElm = $(element)
      scope.$watch attrs.jqShow, (value) ->
        if (hideImmediately && !value)
          jqElm.hide(0, callback)
        else
          $timeout ->
            if (type is "fade")
              if value then jqElm.fadeIn(duration, callback) else jqElm.fadeOut(duration, callback)
            else if (type is "slide")
              if value then jqElm.slideDown(duration, callback) else jqElm.slideUp(duration, callback)
            else
              if value then jqElm.show(duration, callback) else jqElm.hide(duration, callback)
          ,
            delay

  return result
]


##
# Project Starter Controller
# 
@ProjectController = ["$scope", "$http", "$element", ($scope, $http, $element) ->
  $scope.submit = ->
    event.preventDefault()
    # data = $element.find('form').serialize()

    $form = $(event.target)
    url   = $form.attr("action")
    data = $.param({ model: $scope.model })

    # success = (data, status, req) ->
    #   console?.log "SUCCESS"
    #   console?.log data
    #   console?.log status
    #   console?.log req
    #   # console?.log status
    #   # console?.log headers()
    #   # console?.log config
    #   # $scope.sent = true

    # error = (req, status, error) ->
    #   console?.log "ERROR"
    #   console?.log req
    #   console?.log status
    #   console?.log error
    #   # console?.log status
    #   # console?.log headers()
    #   # console?.log config

    success = (data, status, headers, config) ->
      # console?.log "SUCCESS"
      console?.log data
      # console?.log status
      # console?.log headers()
      # console?.log config
      # $scope.sent = true

    error = (data, status, headers, config) ->
      # console?.log "ERROR"
      console?.log data
      # console?.log status
      # console?.log headers()
      # console?.log config

    # req = $http.post(url, data).success(success).error(error)
    # data = angular.toJson(data)
    req = $http({method: "POST", url: url, data: data}).success(success).error(error)
    # req = $.post(url, data).done(success).fail(error)

    console?.log "Submitting..."

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
