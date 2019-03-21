require 'yaml'
require 'creature'

module YamlCreatures

  def self.load_creatures(path)
    yaml_creatures = YAML.load_file(path)
    yaml_creatures.size.times do |i|
      __load_creature__(yaml_creatures[i])
    end
  end

  def self.__load_creature__(line)
    tmp = Class.new(Creature)
    tmp.class_eval do
      define_method(:tank) do |degats|
        eval(line['tanker'])
      end
      define_method(:force) do
        eval(line['force'])
      end
    end
    Kernel.const_set(line['nom'].to_sym, tmp)
  end

end
