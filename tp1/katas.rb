#!/usr/bin/env ruby

## Consigne : Ecrivez les fonctions décrites en dessous de leurs descriptions.
## Ne pas toucher les tests à la fin.

# Signature: add(a, b)
# Retourne l'addition de a et b
def add(a, b)
  a + b
end

# Signature: cat(a, b)
# Retourne la concaténation des deux chaines a & b
def cat(a, b)
    "#{a}#{b}"
end

# Signature: words(s)
# Indice : Regarder la documentation de string
# Retourne les mots de la string s
def words(s)
    s.split
end

# Signature: upcase(s)
# Retourne true mais modifie la string s pour que
# toutes ses lettres soient en majuscules
def upcase(s)
    s.upcase!
    true
end

# Signature: dot(arr)
# Retourne une chaine de caractère avec les éléments du tableau
# séparés par un point milieu ·
# Indice : Regarder la documentation de array
# Exemple : dot(['aut', 'eur', 'trice']) => 'aut·eur·rice'
def dot(arr)
    arr.join '·'
end

# Signature: minimum_length_4(s)
# Retourne une chaine de caractère où les mots de moins de 3 caractères
# sont supprimés
# Exemple : minimum_length_4('I do not like potatoes') => 'like potatoes'
def minimum_length_4(s)
    s.split(' ').select{|w| w.length >= 4}.join ' '
end

# Signature: dumbize(s)
# Retourne une chaîne où uniquement les lettres impaires sont en majuscules
# http://knowyourmeme.com/memes/mocking-spongebob
# Indice : Regarder la documentation de Array et Enumerable
# Exemple : dumbize('Reduire les taxes reduit le chomage') => 'ReDuIrE LeS TaXeS ReDuIt lE ChOmAgE'
def dumbize(s)
    # .split '' == .chars
    s.chars.map.with_index { |l, i| i.odd? l.downcase : l.upcase}.join
end

# Signature: multiply_array(arr, n)
# Retourne un tableau qui contient tous les nombres de arr multipliés par n
# Exemple : multiply_array([1, 2, 3], 3) => [3, 6, 9]
def multiply_array(arr, n)
    arr.map {|v| v * n}
end

# Signature: sum(arr)
# Retourne la somme des nombres du tableau
# Exemple : sum([1, 2, -1, 3]) => 5
def sum(arr)
    arr.reduce {|a,b| a+b}
    #correction : arr.reduce(:+,0) marche aussi
end

# Signature: capitalize_words(s)
# Retourne la string s avec tous les mots en capitalize
# (première lettre en majuscule)
# Exemple : capitalize_words('thanks obama') => 'Thanks Obama'
def capitalize_words(s)
    s.split.map {|w| w.capitalize}.join ' '
    #correction s.split.map(&:capitalize).joint ' ' marche aussi
end

# Signature: enumeration(n)
# Retourne un tableau qui contient tous les nombres
# de 1 à n
# Indice : Regardez les Range
# Exemple : enumeration(3) => [1, 2, 3]
def enumeration(n)
    #a = * Range.new(1,n)
    #avec l'aide :
    Range.new(1,n).to_a
    #ou avec (1..n).to_a
end

# Signature: dictionnary(s)
# Retourne un hash qui contient les mots pour clés et
# leur définitions comme valeur.
# Exemple: dictionnary('Ours: Mammifère carnivore (ursidé)|Lapin: Mammifère rongeur très prolifique') =>
# { 'Ours' => 'Mammifère carnivore (ursidé)', 'Lapin' => 'Mammifère rongeur très prolifique' }
def dictionnary(s)
    h = {}
    s.split('|').each do |w|
        word, definition = w.split ': '
        h[word] = definition
    end
    h
end


# version NERD
#def dictionnary(s)
#  # word_and_def = s.split(/[:|]/).map do |word_or_def|
#  #   word_or_def.strip
#  # end
#  # Hash[*word_and_def]
#  Hash[*s.split(/[:|]/).map(&:strip)]
#end







## Tests qui valident le TP. Ne pas modifier sans quoi
## vous aurez 1000 ans de malheur sur au moins 32 générations.
## En revanche, n'hésitez pas à lire le code.
class KataError < StandardError; end

def assert(kata_name, expected)
  value = eval(kata_name)

  if expected != value
    raise KataError, "#{kata_name}: Got `#{value.inspect}' instead of `#{expected.inspect}'"
  end

  puts "#{kata_name}: Got expected `#{value.inspect}'"
  true
rescue StandardError => e
  raise KataError, "#{kata_name}: #{e.class} - #{e.message}"
end

puts '==================================================='
puts 'Katas to validate:'
puts "==================================================="

# Addition
assert(%/add(1, 1)/, 2)
assert(%/add(1, -1)/, 0)

puts "---------------------------------------------------"

# Concaténation
assert(%/cat('hello, ', 'world')/, 'hello, world')

puts "---------------------------------------------------"

# Words
assert(%/words('Je suis une patate')/, ['Je', 'suis', 'une', 'patate'])
assert(%/words('   Vous ne passerez pas   ')/, ['Vous', 'ne', 'passerez', 'pas'])

puts "---------------------------------------------------"

# Upcase
assert(%/(s = 'khaaan' ; upcase(s); s)/, 'KHAAAN')

puts "---------------------------------------------------"

# Dot
assert(%/dot(['aut', 'eur', 'rice'])/, 'aut·eur·rice')
assert(%/dot(['La', 'réponse', 'est', 42])/, 'La·réponse·est·42')

puts "---------------------------------------------------"

# Minimum length 4
assert(%/minimum_length_4('I do not like dwarfs')/, 'like dwarfs')
assert(%/minimum_length_4('And my axe')/, '')

puts "---------------------------------------------------"

# Dumbize
assert(%/dumbize('Jet fuels don\\'t melt steel beams')/, 'JeT FuElS DoN\'T MeLt sTeEl bEaMs')

puts "---------------------------------------------------"

# Multiply array
assert(%/multiply_array([1, 2, 3], 3)/, [3, 6, 9])

assert(%/multiply_array([4, -2, 0], -2)/, [-8, 4, 0])

puts "---------------------------------------------------"

# Sum
assert(%/sum([1, 2, 3])/, 6)
assert(%/sum([1, 2, -1, 3])/, 5)

puts "---------------------------------------------------"

# Capitalize words
assert(%/capitalize_words('Je ne connais pas la ponctuation')/, 'Je Ne Connais Pas La Ponctuation')

puts "---------------------------------------------------"

# Enumeration
assert(%/enumeration(3)/, [1, 2, 3])
assert(%/enumeration(-1)/, [])

puts "---------------------------------------------------"

# Dictionnary
assert(
  %/dictionnary('Ours: Mammifère carnivore (ursidé)|Lapin: Mammifère rongeur très prolifique')/,
  { 'Ours' => 'Mammifère carnivore (ursidé)', 'Lapin' => 'Mammifère rongeur très prolifique'})

# Message de félicitation
puts "==================================================="
puts "Every test passed..."
puts "#{ENV['USER']}, thou art the greatest!"
