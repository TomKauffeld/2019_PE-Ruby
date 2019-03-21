class Creature

  attr_reader :name, :hp

  def initialize(name, health_points)
    @name = name
    @hp = health_points
  end

  def tank(degats)
    degats
  end

  def take_damage(damage)
    @hp -= tank(damage)
  end

  def force
    1
  end

  def attack(other_creature)
    other_creature.take_damage(force)
  end

  def dead?
    @hp <= 0
  end

  def to_s
    return "#{@name} : I've still got #{@hp} hp left" unless dead?

    "#{@name}..." if dead?
  end

  private
  def pv
    @hp
  end

end
