
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end



  get '/' do
    redirect to "/articles"
  end

    #CREATE a new article

  get '/articles/new' do
    #@article = Article.new
    erb :new
  end
  
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  #READ (show a given article/ after creation /and index of all articles)

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  get '/articles' do
    @articles = Article.all 
    erb :index
  end

  #EDIT an Article

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
    
  end

 #DELETE and article

 delete '/articles/:id' do
  @article = Article.find(params[:id])
  @article.destroy
  redirect to "/articles"
 end
 

end
