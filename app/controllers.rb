OnePageSites::App.controllers  do
  
  # GET /
  get :index, cache: true do
    expires_in 600
    render "static/index"
  end

  # POST /start
  post :start do
    @project = ProjectForm.new params[:model]
    @result = @project.submit
    if @result[:success]
      response.status = 200
    else
      response.status = 422
    end
    json @result
  end

  # POST /newsletter
  post :newsletter do
    @subscription = NewsletterSubscribe.new params[:model]
    @result = @subscription.submit
    if @result[:success]
      response.status = 200
    else
      response.status = 422
    end
    json @result
  end

  # Errors
  get '404' do
    render "errors/404"
  end

  get '500' do
    render "errors/500"
  end

  error 404 do
    render "errors/404"
  end

  error 500 do
    render "errors/500"
  end

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

end
