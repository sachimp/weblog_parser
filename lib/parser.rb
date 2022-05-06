# frozen_string_literal: true

# specify the file path
file_name = File.join(__dir__, 'webserver.log')

# open the log to read
log = File.open(file_name, 'r') do |f|
  f.read
end

# split the info along the spaces and make it into an array
array = log.to_s.split

#sort the array of strings into pairs (["page visit", "ip address"])
pairs = array.each_slice(2) do |string|
  p string
end
