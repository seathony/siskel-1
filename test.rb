require 'minitest/autorun'
require './siskel.rb'
# Siskel tests
class TestSiskel < Minitest::Test
  def test_movie_title
    movie = Siskel.new('Kill Bill')
    assert_equal 'Kill Bill: Vol. 1', movie.title
  end

  def test_movie_rating
    movie = Siskel.new('The Hangover')
    assert_equal 'R', movie.rating
  end

  def test_movie_year
    movie = Siskel.new("Blade Runner")
    assert_equal "1982", movie.year
  end

   def test_movie_plot
     movie = Siskel.new("Mean Girls")
     assert_equal "Cady Heron is a hit with The Plastics, the A-list girl clique at her new school, until she makes the mistake of falling for Aaron Samuels, the ex-boyfriend of alpha Plastic Regina George.", movie.plot
   end

  def test_fake_movie_title
    movie = Siskel.new("Walter's Wonderful World, A Very Fake Movie")
    assert_equal "Movie not found!", movie.title
  end

  def test_remake_with_different_year
    movie = Siskel.new("Parent Trap", year: 1961)
    assert_equal "1961", movie.year
  end

  def test_movie_with_full_plot
    movie = Siskel.new("Titanic", plot: :full)
    assert_equal "84 years later, a 101-year-old woman named Rose DeWitt Bukater tells the story to her granddaughter Lizzy Calvert, Brock Lovett, Lewis Bodine, Bobby Buell and Anatoly Mikailavich on the Keldysh about her life set in April 10th 1912, on a ship called Titanic when young Rose boards the departing ship with the upper-class passengers and her mother, Ruth DeWitt Bukater, and her fiancé, Caledon Hockley. Meanwhile, a drifter and artist named Jack Dawson and his best friend Fabrizio De Rossi win third-class tickets to the ship in a game. And she explains the whole story from departure until the death of Titanic on its first and last voyage April 15th, 1912 at 2:20 in the morning.", movie.plot
  end

  # Films with a tomato meter between 76 and 100 get two thumbs up.
  # Films with a tomato meter between 51 and 75 get a thumbs up.
  # Films with a tomato meter between 26 and 50 get a thumbs down.
  # Films with a tomato meter between 0 and 25 get two thumbs down.

  def test_movie_concensus_positive
    movie = Siskel.new("The Fifth Element")
    assert_equal "Thumbs Up", movie.concensus
  end

  def test_movie_concensus_negative
    movie = Siskel.new("Daredevil")
    assert_equal "Thumbs Down", movie.concensus
  end
end
