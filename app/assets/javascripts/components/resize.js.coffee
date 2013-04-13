# Resize certain elements to nearly fill screen on resize
$(window).on "resize", (event) ->
  $("[data-resize]").each ->
    $self = $(@)
    threshold = $self.data("resize")
    currentWidth = $(window).width()

    height = if currentWidth >= threshold then $(window).height() - 10 else ""
    $self.css("min-height", height)


# Trigger first resize
jQuery ->
  $(window).trigger "resize"
