
require 'rails_helper'
require 'spec_helper'

describe Movie, type: :model do

  describe '.find_in_tmdb' do

    before :each do

      @api_response = {
        results: [
          {
            title: 'Manhunter',
            release_date: '1986-08-15',
            original_language: 'en',
            overview: 'A crime thriller.'
          },
          {
            title: 'French Movie',
            release_date: '1986-07-01',
            original_language: 'fr',
            overview: 'A French movie.'
          }
        ]
      }

      stub_request(
        :get,
        'https://api.themoviedb.org/3/search/movie'
      ).with(
        query: {
          'api_key' => 'test-key',
          'query' => 'Manhunter',
          'year' => '1986',
          'language' => 'en-US'
        }
      ).to_return(
        status: 200,
        body: @api_response.to_json,
        headers: {
          'Content-Type' => 'application/json'
        }
      )

    end

    it 'returns movie objects from TMDb results' do

      movies = Movie.find_in_tmdb(
        {
          title: 'Manhunter',
          release_year: '1986',
          language: 'en'
        },
        'test-key'
      )

      expect(movies.length).to eq(1)
      expect(movies.first).to be_a(Movie)
      expect(movies.first.title).to eq('Manhunter')
      expect(movies.first.rating).to eq('R')

    end

    it 'does not save search results to the database' do

      expect {
        Movie.find_in_tmdb(
          {
            title: 'Manhunter',
            release_year: '1986',
            language: 'en'
          },
          'test-key'
        )
      }.not_to change(Movie, :count)

    end

    it 'does not make an API call for a blank title' do

      expect(Faraday).not_to receive(:get)

      results = Movie.find_in_tmdb(
        { title: '' },
        'test-key'
      )

      expect(results).to eq([])

    end

  end

end
