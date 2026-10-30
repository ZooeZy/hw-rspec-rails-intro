
require 'rails_helper'

describe MoviesController, type: :controller do

  describe 'searching TMDb' do

    before :each do
      @fake_results = [double('movie1'), double('movie2')]
    end

    it 'calls the model method that performs TMDb search' do
      expect(Movie).to receive(:find_in_tmdb)
        .with('hardware')
        .and_return(@fake_results)

      get :search_tmdb, params: { search_terms: 'hardware' }
    end

    describe 'after valid search' do

      before :each do
        allow(Movie).to receive(:find_in_tmdb)
          .and_return(@fake_results)

        get :search_tmdb, params: { search_terms: 'hardware' }
      end

      it 'selects the Search Results template for rendering' do
        expect(response).to render_template('search_tmdb')
      end

      it 'makes the TMDb search results available to that template' do
        expect(assigns(:movies)).to eq(@fake_results)
      end

    end

    it 'shows a warning when title is missing' do
      expect(Movie).not_to receive(:find_in_tmdb)

      get :search_tmdb, params: { title: '' }

      expect(flash.now[:warning])
        .to eq('Please fill in all required fields!')
    end

    it 'shows a warning when no movies are found' do
      allow(Movie).to receive(:find_in_tmdb).and_return([])

      get :search_tmdb, params: {
        title: 'Unknown Movie',
        release_year: '',
        language: 'all'
      }

      expect(flash.now[:warning])
        .to eq('No movies found with given parameters!')
    end

  end

  describe 'adding a movie from TMDb' do

    it 'saves the selected movie to the database' do
      movie_attributes = {
        title: 'Manhunter',
        rating: 'R',
        release_date: '1986-08-15',
        description: 'A crime thriller.'
      }

      expect {
        post :add_movie, params: movie_attributes
      }.to change(Movie, :count).by(1)

      expect(response).to redirect_to(search_tmdb_path)
    end

  end

end
