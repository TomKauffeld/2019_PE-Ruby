class BinTree
  include Enumerable

  def initialize(value)
    @left  = nil
    @right = nil
    @value = value
  end

  def each
    @left.each  { |v| yield v } unless @left.nil?
    yield @value unless @value.nil?
    @right.each { |v| yield v } unless @right.nil?
  end

  def depth
    dl = depth_left
    dr = depth_right
    (dl > dr ? dl : dr) + 1
  end

  def add(value)
    add_right value if value > @value
    add_left  value if value < @value
  end

  def search(value)
    if value > @value
      search_right value
    elsif value < @value
      search_left value
    else
      @value
    end
  end

  private

  def add_left(value)
    @left.add value unless @left.nil?
    @left = BinTree.new value if @left.nil?
  end

  def add_right(value)
    @right.add value unless @right.nil?
    @right = BinTree.new value if @right.nil?
  end

  def search_left(value)
    if @left.nil?
      nil
    else
      @left.search value
    end
  end

  def search_right(value)
    if @right.nil?
      nil
    else
      @right.search value
    end
  end

  def depth_left
    if @left.nil?
      0
    else
      @left.depth
    end
  end

  def depth_right
    if @right.nil?
      0
    else
      @right.depth
    end
  end
end
