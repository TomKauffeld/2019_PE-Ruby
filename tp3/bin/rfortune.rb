#!./usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

def rfortune(location)
  fortunes = []
  return fortunes unless File.exist?(location)

  File.open(location) do |file|
    fortunes += file.readlines("\n%\n")
  end
  fortunes.each do |fortune|
    fortune.chomp!("\n%\n")
  end
  fortunes
end

if ARGV.empty?
  puts 'Please enter one or more filenames'
  return
end

fortunes = []

ARGV.each do |argument|
  fortunes.push(*rfortune(argument))
end

puts fortunes.size
