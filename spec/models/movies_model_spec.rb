require 'rails_helper'

describe Movie, '.search_by_director' do
    it 'finds movies with the same director' do
        movie_1 = Movie.create(:title => "The Dark Knight", :director => "Christopher Nolan")
        movie_2 = Movie.create(:title => "Inception", :director => "Christopher Nolan")
        expect(Movie.similar_movies(movie_1.title)).to eql(["The Dark Knight","Inception"])
    end

    it 'does not find movies with different directors' do
        movie_1 = Movie.create(:title => "The Dark Knight", :director => "Christopher Nolan")
        movie_2 = Movie.create(:title => "Harry Potter", :director => "David Yates")
        expect(Movie.similar_movies(movie_1.title)).to_not include(['Harry Potter'])
    end
end 