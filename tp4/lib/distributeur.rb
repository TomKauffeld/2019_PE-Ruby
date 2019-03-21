class Distributeur
  def initialize(file)
    @path = file
    @ready = false
    @file = nil
    @mutex = Mutex.new
    @mutex_demand = Mutex.new
    @list = Queue.new
    @signal = ConditionVariable.new
    @demand = 0
  end

  def read

    @mutex.lock
    @file = File.open(@path, 'r')
    @reading = true
    while (line = @file.gets) && @reading
      @mutex_demand.lock
      if @list.size < 100 || @demand > 0
        @list << line
        @demand -= 1 if @demand > 0
      else
        @signal.wait @mutex_demand
      end
      @mutex_demand.unlock
    end

    @file.close
    @mutex.unlock

  end

  def stop
    return unless @reading

    @reading = false
    @signal.signal
  end

  def get(amount)
    ret = []
    @mutex_demand.synchronize do
      tmp = amount - @list.size + @demand
      @demand = tmp if tmp > 0
      @signal.signal
    end
    amount.times do
      ret << @list.pop
    end
    ret
  end
end
