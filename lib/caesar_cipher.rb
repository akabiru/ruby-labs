def caesar_cipher(string, shift_factor)
  return string if shift_factor == 0
  shift_right = shift_factor > 0 || false
  shift_factor = shift_factor.abs % 26 unless shift_factor.abs.between?(1, 26)
  cipher = ''
  
  string.split('').each do |char|
    new_ascii = char.ord + shift_factor
    
    if char.ord.between?(65, 90) || char.ord.between?(97, 122)
      if new_ascii < 65
        new_ascii = new_ascii + 26
      elsif new_ascii > 90 && new_ascii < 97 || new_ascii > 122
        new_ascii = new_ascii - 26
      end
      cipher << new_ascii.chr
    else
      cipher << char
    end
  end
  cipher
end