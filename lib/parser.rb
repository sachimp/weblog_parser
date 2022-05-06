# frozen_string_literal: true

# specify the file path
file_name = File.join(__dir__, 'webserver.log')

# open the log to read
log = File.open(file_name, 'r') do |f|
  f.read
end

def page_views(log)
  array = log.to_s.split
  page_names = []
  pairs = array.each_slice(2) do |string_pair|
    page_names << string_pair[0]
  end
  page_names.tally
end

def unique_page_views()
end

p page_views(log)
