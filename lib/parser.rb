# frozen_string_literal: true

file_name = File.join(__dir__, 'webserver.log')
log = File.open(file_name, 'r') do |f|
  p f.read
end
