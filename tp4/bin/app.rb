#!./usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'brute_force'
require 'distributeur'

# brute = BruteForce.new('http://localhost:7654/epreuve')

# puts brute.test('admin', 'admin')

dis = Distributeur.new '../res/dico.txt'

thread = Thread.new { dis.read }

array = []

5.times.map do |i|
  Thread.new do
    array[i] = dis.get 20
  end
end

dis.stop
thread.join

array.each(&method(:puts))

