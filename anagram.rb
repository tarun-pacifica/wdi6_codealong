system('clear')
require 'pry'

class Anagram
  attr_reader :subject, :letters

  def initialize(subject)
    @subject = subject
    @letters = breakdown(subject)
  end

  def match(words)
    words.select do |word|
      breakdown(word) == @letters
    end

  end


  private

    def breakdown(word)
      word.chars.sort
    end

end

binding.pry