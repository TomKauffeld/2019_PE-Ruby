#!./usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'bin_tree'
require 'un_accent'

bin_tree = BinTree.new(5)

bin_tree.add 1
bin_tree.add 2
bin_tree.add 3
bin_tree.add 4
bin_tree.add 7
bin_tree.add 6

bin_tree.each { |i| puts i.to_s }
puts "depth : #{bin_tree.depth}"


s = 'êéèëùûü'
puts s.to_us
