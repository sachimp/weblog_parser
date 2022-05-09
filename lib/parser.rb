# frozen_string_literal: true

# specify the file path

file_name = File.join(__dir__, 'webserver.log')

# open the log to read, store it in a global vairable for any needed parsing

LOG = File.open(file_name, 'r') do |f|
  f.read
end

# service object called with a file to parse, methods complete the appropriate tasks
class Parser
  def initialize(file)
    @file = file
  end

  def all_page_views
    array = log_to_array(@file)
    page_names = array.each_slice(2).map do |string_pair|
      string_pair[0]
    end
    display(page_names.tally.sort_by { |_k, v| -v })
  end

  def unique_page_views
    array = log_to_array(@file)
    unique = find_unique_pairs(array)
    pages = unique.tally.keys.map do |pair|
      pair[0]
    end
    display(pages.tally.sort_by { |_k, v| -v })
  end

  private

  def display(array)
    array.map.with_index(1) do |pair, index|
      puts "#{index}. #{pair[0]}, #{pair[1]} views"
    end
  end

  def log_to_array(file)
    array = file.to_s.split
  end

  def find_unique_pairs(array)
    array.each_slice(2).map.uniq do |string_pair|
      string_pair
    end
  end
end

test = Parser.new(LOG)
test.all_page_views
puts ''
test.unique_page_views
