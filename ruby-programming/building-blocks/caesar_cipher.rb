def caesar_cipher string, shift
  cipher = ''

  string.each_byte do |c|

    # upper case
    if c > 64 && c < 91
      cipher << ((c - 65 + shift) % 26 + 65).chr
    # lower case
    elsif c > 96 && c < 123
      cipher << ((c - 97 + shift) % 26 + 97).chr
    # non-letter
    else
      cipher << c.chr
    end

  end

  return cipher

end