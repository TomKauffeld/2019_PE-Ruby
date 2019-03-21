


if ARGV.size != 1
    puts 'please give the filename as argument'
    exit
end

h = Hash.new(0)
s = File.read(ARGV[0]).scan(/\w+/).map{|w| w.strip.downcase}.select {|w| w != nil && w.length > 2}.each {|w| h[w.to_sym]++}.size
h.to_a.sort_by{|p| -p.last}.each {|kv| puts "#{kv[0].to_s} : #{v[1]/s}"}
