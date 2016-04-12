def caesar_cipher string, shift

  string.each_byte do |c|

    # upper case
    if c > 64 && c < 91
      print ((c - 65 + shift) % 26 + 65).chr
    # lower case
    elsif c > 96 && c < 123
      print ((c - 97 + shift) % 26 + 97).chr
    else
      print c.chr
    end

  end

end