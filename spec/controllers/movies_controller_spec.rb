require 'rails_helper'
describe MoviesController do
  describe 'Search movies by the same director' do
    it 'should call Movie.similar_movies' do
      expect(Movie).to receive(:similar_movies).with('Movie1')
      get :movie_with_same_director, { title: 'Movie1' }
    end

    it 'Need to assign similar movies if director exists' do
      movies = ['Movie2', 'Movie3']
      Movie.stub(:similar_movies).with('Movie2').and_return(movies)
      get :movie_with_same_director, { title: 'Movie2' }
      expect(assigns(:similar_movies)).to eql(movies)
    end

    it "should redirect to home page if director isn't known" do
      Movie.stub(:similar_movies).with('Movie3').and_return(nil)
      get :movie_with_same_director, { title: 'Movie3' }
      expect(response).to redirect_to(movies_path)
    end
 end
end