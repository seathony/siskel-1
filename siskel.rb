require 'httparty'

class Siskel
  attr_accessor :title, :rating, :year, :plot, :options, :tomato_score
  def initialize(title, options = {})
    @options = options
    url = 'http://www.omdbapi.com/?' + options_builder(title, @options)
    movie = HTTParty.get(url)
    @tomato_score = movie['tomatoMeter'].to_i
    @title = movie['Title'] || 'Movie not found!'
    @rating = movie['Rated']
    @year = movie['Year']
    @plot = movie['Plot']
  end

  def options_builder(title, options)
    parameters = []
    parameters.push "t=#{title}"
    parameters.push 'tomatoes=true'
    parameters.push "y=#{options[:year]}" if options[:year]
    parameters.push "plot=#{options[:plot]}" if options[:plot]
    parameters.join('&')
  end

  def concensus
    if @tomato_score.between?(76, 100)
      'Two Thumbs Up'
    elsif @tomato_score.between?(51, 75)
      'Thumbs Up'
    elsif @tomato_score.between?(26, 50)
      'Thumbs Down'
    else
      'Two Thumbs Down'
    end
  end
end
