
class Movie < ActiveRecord::Base

  class TmdbError < StandardError; end

  def self.all_ratings
    %w[G PG PG-13 R]
  end

  def self.with_ratings(ratings, sort_by)
    if ratings.nil?
      all.order sort_by
    else
      where(rating: ratings.map(&:upcase)).order sort_by
    end
  end

  # Search for movies using the TMDb API
  def self.find_in_tmdb(search_terms, api_key = ENV['TMDB_API_KEY'])

    params = if search_terms.is_a?(Hash)
      search_terms.with_indifferent_access
    else
      { 'title' => search_terms }
    end

    title = params[:title].to_s.strip

    return [] if title.empty?

    query_params = {
      api_key: api_key,
      query: title
    }

    year = params[:release_year].to_s.strip

    if year.present?
      query_params[:year] = year
    end

    if params[:language] == 'en'
      query_params[:language] = 'en-US'
    end

    response = Faraday.get(
      'https://api.themoviedb.org/3/search/movie',
      query_params
    )

    unless response.success?
      raise TmdbError, "TMDb returned status #{response.status}"
    end

    data = JSON.parse(response.body)
    results = Array(data['results'])

    if params[:language] == 'en'
      results = results.select do |movie|
        movie['original_language'] == 'en'
      end
    end

    results.map do |movie_data|

      release_date = movie_data['release_date'].to_s

      parsed_date = if release_date.empty?
        nil
      else
        Date.parse(release_date)
      end

      Movie.new(
        title: movie_data['title'],
        rating: 'R',
        release_date: parsed_date,
        description: movie_data['overview']
      )

    end
  end

end
