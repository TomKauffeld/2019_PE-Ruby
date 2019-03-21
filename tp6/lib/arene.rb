module Arene

  def self.dual_from_dual(dual)
    dual(dual.name, dual.creature_one, dual.creature_two)
  end

  def self.dual(name, creature_one, creature_two)
    p "Dual #{name}"
    p 'Ready ?'
    p 'Fight'
    until creature_two.dead? || creature_one.dead?
      turn = Random.rand
      __dual_turn__(creature_one, creature_two, turn)
    end
    __announce_results__(creature_one, creature_two)
  end

  def self.__dual_turn__(creature_one, creature_two, turn)
    if turn >= 0.5
      creature_one.attack(creature_two)
      p "#{creature_one.name} attacks #{creature_two.name}"
      p creature_two.to_s
    else
      creature_two.attack(creature_one)
      p "#{creature_two.name} attacks #{creature_one.name}"
      p creature_one.to_s
    end
  end

  def self.__announce_results__(creature_one, creature_two)
    if __creature_one_win__(creature_one, creature_two)
      p "And the winner is #{creature_one.name}"
      p "With still #{creature_one.hp} left"
    elsif __creature_two_win__(creature_one, creature_two)
      p "And the winner is #{creature_two.name}"
      p "With still #{creature_two.hp} left"
    else
      p 'And both are defeated'
    end
  end

  def self.__creature_one_win__(creature_one, creature_two)
    !creature_one.dead? && creature_two.dead?
  end

  def self.__creature_two_win__(creature_one, creature_two)
    !creature_two.dead? && creature_one.dead?
  end
end
