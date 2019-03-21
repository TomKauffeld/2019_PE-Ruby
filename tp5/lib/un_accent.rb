#encoding: utf-8
module UnAccent
  def accents_init
    [%W[\u00EA\u00E9\u00E8\u00EB e], %W[\u00F9\u00FB\u00FC u],
     %W[\u00E7 c], %W[\u00F4\u00F6 o], %W[\u00E0\u00E2\u00E4 a],
     %W[\u00EE\u00EF i], %W[\u00E6 ae], %W[\u0153 oe],
     %W[\u00CA\u00C9\u00C8\u00CB E], %W[\u00D9\u00DB\u00DC U],
     %W[\u00C7 C], %W[\u00D4\u00D6 O], %W[\u00C0\u00C2\u00C4 A],
     %W[\u00CE\u00CF I], %W[\u00C6 AE], %W[\u0152 OE]]
  end

  def to_us
    str = to_s
    accents = accents_init
    accents.each do |acc|
      r = acc[1]
      acc[0].each_char do |l|
        str.gsub!(l, r)
      end
    end
    str
  end

end

class String
  include UnAccent
end
