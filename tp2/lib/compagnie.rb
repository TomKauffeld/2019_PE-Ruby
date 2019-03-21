require 'creature'
# @!attribute [Creature[]] @creatures
class Compagnie
  def initialize
    @creatures = []
  end

  # @param [Creature] creature
  def add(creature)
    throw ArgumentError, "pas d'hymogene" if @creatures.include?(creature)
    @creatures.push(creature)
    creature.compagnie = self
  end

  # @param [Creature] creature
  def creature_death(creature)
    @creatures.delete creature
  end

  def find_creature(name)
    @creatures.index do |creature|
      creature.name == name
    end
  end

  def change_place_name(name1, name2)
    i1 = find_creature(name1)
    i2 = find_creature(name2)
    change_place_index(i1, i2)
  end

  def change_place_index(index1, index2)
    @creatures[index1], @creatures[index2] = @creatures[index2], @creatures[index1]
  end

  def change_place_index_name(index, name)
    i2 = find_creature(name)
    change_place_index(index, i2)
  end

  def find_creature_least_hp
    min_hp = nil
    @creatures.each do |c|
      if min_hp.nil? || c.hp < min_hp.hp
        min_hp = c
      end
    end
    min_hp
  end

  def exploration
    afficher
    @creatures[0].encaisser(10)
    afficher
    change_place_index_name(0, 'Zak')
    afficher
    change_place_name('Grok', 'Gruk')
    afficher
    @creatures[1].encaisser(14)
    afficher
    find_creature_least_hp.soigner(5)
    afficher
    @creatures[0].encaisser(10)
    afficher
    
  end

  def to_s
    @creatures.reduce('') do |a, v|
      "#{a}#{v}\t"
    end
  end

  def afficher
    puts self
  end
end
