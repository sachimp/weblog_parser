# frozen_string_literal: true

# specify the file path

file_name = File.join(__dir__, 'webserver.log')

# open the log to read, store it in a global vairable for any needed parsing

LOG = File.open(file_name, 'r') do |f|
  f.read
end

# create the methods, which call on a display method at the end to return the list appropriately

def page_views(log)
  array = log.to_s.split
  page_names = []
  pairs = array.each_slice(2) do |string_pair|
    page_names << string_pair[0]
  end
  display(page_names.tally.sort_by{|k, v| -v})
end

def unique_page_views(log)
  array = log.to_s.split
  unique = array.each_slice(2).map.uniq do |string_pair|
    string_pair
  end
  pages = unique.tally.keys.map do |pair|
    pair[0]
  end
  display(pages.tally.sort_by{|k, v| -v})
end

# display method for a nicer list view in the terminal
# (without this it would just be an array of arrays)

def display(array)
  array.map.with_index(1) do |pair, index|
    puts "#{index}. #{pair[0]}, #{pair[1]} views"
  end
end

# call the methods to see the results!

page_views(LOG)
unique_page_views(LOG)
