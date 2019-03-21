#!./usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'arene'
require 'yaml_creatures'
require 'yaml_duals'

YamlCreatures.load_creatures('../res/creatures.yml')
duals = YamlDuals.load_duals('../res/duels.yml')

duals.each do |dual|
  Arene.dual_from_dual(dual)
  p ''
  p ''
end

