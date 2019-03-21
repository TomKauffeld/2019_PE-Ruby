#!./usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'compagnie'
require 'troll'
require 'gobelin'


c = Compagnie.new

c.add(Troll.new("Gruk", 27))
c.add(Troll.new("Grok", 24))
c.add(Gobelin.new("Zak", 12))
c.add(Gobelin.new("Zog", 13))

c.exploration