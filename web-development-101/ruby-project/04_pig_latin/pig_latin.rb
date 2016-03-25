def translate s
  s_array = s.split

  for i in 0..s_array.length-1
    # no cut
    if /[aeiou]/.match(s_array[i][0])
      s_array[i] << 'ay'
    # cut 1
    elsif /[aeiou]/.match(s_array[i][1]) && !(s_array[i][0]=='q' && s_array[i][1]=='u')
      s_array[i] << (s_array[i][0]+'ay')
      s_array[i] = s_array[i].slice(1, s_array[i].length)
    # cut 2
    elsif /[aeiou]/.match(s_array[i][2]) && !(s_array[i][1]=='q' && s_array[i][2]=='u')
      s_array[i] << (s_array[i].slice(0, 2)+'ay')
      s_array[i] = s_array[i].slice(2, s_array[i].length)
    # cut 3
    else
      s_array[i] << (s_array[i].slice(0, 3)+'ay')
      s_array[i] = s_array[i].slice(3, s_array[i].length)
    end
  end
  s_array.join(' ')
end