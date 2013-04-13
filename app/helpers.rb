# Helper methods defined here can be accessed in any controller or view in the application

OnePageSites::App.helpers do
  # Display IcoMoon font icon
  def icon key
    "<i data-icon=&#x#{h(key)}></i>".html_safe
  end

end
