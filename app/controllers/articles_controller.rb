
# this controller is inheriting everything from the ApplicationController without having to do require "application_controller" # DON'T DO THIS.

class ArticlesController < ApplicationController
  # The index action is empty. When an action does not explicitly render a view (or otherwise trigger an HTTP response), Rails will automatically render a view that matches the name of the controller and action. Convention Over Configuration! Views are located in the app/views directory. So the index action will render app/views/articles/index.html.erb by default.
  def index
    # fetching all articles form the database using the controller instance variable
    # also!! Article.all is the method you used in the console to query everything from the database
    @articles = Article.all
  end

  # note this will connect with the route being declared in the config/routes!! the action that is being used there then will be declared here with its purpose!!! with the id captured as the route parameter,, by default the show action will render app/views/articles/show.html.erb.
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      # the new action instantiates a new article but does not save it
      render :new, status, :unprocessable_entity
    end
  end

  # this is privately declared and then used as the parameters when a new article is created,, rather than before we had hard coded in title and body in the create method
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
