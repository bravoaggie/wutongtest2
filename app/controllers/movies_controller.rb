class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
  def index
<<<<<<< HEAD
    unless session[:redirect]
      if params[:order].is_a?(String)
         session[:order] = params[:order]
         session[:redirect] = true
      elsif params[:order].is_a?(Hash)
         session[:order] = params[:order].keys.first
         session[:redirect] = true
      end
      if params[:ratings]
         session[:ratings] = params[:ratings]
         session[:redirect] = true 
      end
    else
      session[:redirect] = false
=======
 
    if params[:order].is_a?(String)
       @hilite = params[:order] 
       session[:order] = @hilite
    elsif params[:order].is_a?(Hash)
    	  @hilite = params[:order].keys.first
        session[:order] = @hilite
    end
    if params[:ratings]
       session[:ratings] = params[:ratings] 
>>>>>>> parent of 3cc44aa... fixes
    end     
    if session[:order] and session[:ratings]
      @movies = Movie.where(rating: session[:ratings].keys).order("#{session[:order]} ASC") 
<<<<<<< HEAD
      @hilite = session[:order]
=======
      @hilite = session[:order] 
      redirect_to :action => :index, :order => session[:order]
>>>>>>> parent of 3cc44aa... fixes
    elsif session[:ratings]
      @movies = Movie.where(rating: session[:ratings].keys)
    elsif session[:order]
      @movies = Movie.all(order: "#{session[:order]} ASC")
      @hilite = session[:order]
      
      
    else
      @movies = Movie.all
    end 
    @all_ratings = Movie.ratings

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "Movie was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "movie-title was successfully updated."
    redirect_to movie_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "movie title deleted."
    redirect_to movies_path
  end

end
