class Fixnum
  @@KNOWN_TRANSLATIONS = {
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
  }
  def roman
    return "" if self == 0

    key, translation = get_highest_roman_translation

    translation + (self - key).roman
  end

  def get_highest_roman_translation
    @@KNOWN_TRANSLATIONS.select{|key, value| self / key > 0}.max_by{|key,value| key}
  end
end
