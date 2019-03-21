require 'yaml'
require 'dual'

module YamlDuals

  def self.load_duals(path)
    yaml_duals = YAML.load_file(path)
    duals = []
    yaml_duals.size.times do |i|
      duals.push(__load_dual__(yaml_duals[i]))
    end
    duals
  end

  def self.__load_dual__(line)
    name = line['nom']
    fighters = line['duelistes']
    creature_one = __load_fighter__(fighters[0])
    creature_two = __load_fighter__(fighters[1])
    Dual.new(name, creature_one, creature_two)
  end

  def self.__load_fighter__(fighter)
    name = fighter['nom']
    hp = fighter['pv']
    Kernel.const_get(fighter['race']).new(name, hp)
  end

end
