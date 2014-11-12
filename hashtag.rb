system('clear')
require 'pry'


class Hashtag

  def get_tag(string)
    b = string.split(' ').select {|c| /#\w+/.match(c)}
  end

end

binding.pry