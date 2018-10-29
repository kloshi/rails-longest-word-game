require 'json'
require 'open-uri'
# require 'pry'

class GamesController < ApplicationController
  @letters = []

  def new
    @letters = (0...8).map { (65 + rand(26)).chr }
  end

  def valid?(word)
    url = 'https://wagon-dictionary.herokuapp.com/' + word
    response = JSON.parse(open(url).read)
    return response['found']
  end

  def in_grid?(word, grid)
    arr1 = word.split('').sort
    arr2 = grid[0..arr1.length]
    return arr1 == arr2
    # raise
  end

  def score
    @score = 0
    # user input:
    @user_word = params[:word]
    @letters = params[:letters]
    raise
    # check if the word is valid (via the API)
    @valid_word = valid?(@user_word)
    @word_in_grid = in_grid?(@user_word, @letters)
    # calculate score
    @score = @user_word.length if @valid_word

    # raise
    # show the score (happend in the view)
  end
end
