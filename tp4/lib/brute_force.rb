require 'net/http'
class BruteForce
  def initialize(url, path)
    @con = Connection.new url
    @dis = Distributeur.new path
    @mutex = Mutex.new
    @perCycle = 20
  end

  def test(nb_threads)
    @going = true
    Array.new(nb_threads).map do
      while @going
        words = @dis.get(@perCycle)
        username = 0
        password = 0
        while username < @perCycle
          while password < @perCycle
            user = words[username]
            pass = words[password]
            print("Found -- #{user} : #{pass}") if @con.test(user, pass)
          end
        end
      end
    end.each(&:join)
  end

  def stop
    @going = false
  end

  def print(message)
    @mutex.lock
    puts message
    @mutex.unlock
  end
end
