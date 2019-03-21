def average(arr)
  arr.sum / arr.size
end

def ping(destination, keep = 10)
  io = IO.popen("ping #{destination} -n 20")
  file = File.open('../res/log.txt', 'a')
  pings = []
  io.each_line do |line|
    next unless line =~ /time(=|<)([0-9]+(\.[0-9]+)?)/

    current = Regexp.last_match(2).to_f
    pings.push(current)
    pings.shift(pings.size - keep) if pings.size > keep
    avg = average(pings)
    time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    str = "#{time} current ping : #{current}   average : #{avg}"
    file.write(str)
    puts str
  end
  file.close
  io.close
end

ping('google.com')
