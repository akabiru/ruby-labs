def check_range(shift_factor)
	shift_right = shift_factor > 0 || false

	unless shift_factor.abs.between?(1, 26)
		shift_factor = shift_factor.abs % 26
	end
	return shift_factor, shift_right
end


def caesar_cipher(string, shift_factor)
	cipher = ''	
	checked_shift_factor, shift_right = check_range(shift_factor)

	string.split('').each do |char|
		if char.ord.between?(65, 90) || char.ord.between?(97, 122)
			char_ascii = char.ord
			char_ascii = -checked_shift_factor unless shift_right
			cipher << (char_ascii + checked_shift_factor).chr
		else
			cipher << char
		end
	end
	cipher
end

puts caesar_cipher('What a string', 5)
# Bmfy f xywnsl
puts caesar_cipher('context are the default aliases!!', 7)
# jvualea hyl aol klmhbsa hsphzlz!!
puts caesar_cipher('from spec/spec_helper.rb', 25)
# eqnl rodb/rodb_gdkodq.qa