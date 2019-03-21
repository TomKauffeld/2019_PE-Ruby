require 'compagnie'
class Creature
  attr_accessor :compagnie
  attr_reader :name, :hp

  def initialize(nom, pv)
    @name = nom
    @hp = pv
  end

  def encaisser(degats)
    @hp -= degats
    if @hp <= 0
      @compagnie.creature_death(self)
    end
  end

  def to_s
    "#{@name} a #{@hp} pv"
  end

  def soigner(pv)
    @hp += pv
  end

end
