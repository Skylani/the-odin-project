class Book

  # getter
  def title
    @title
  end

  # setter
  def title=(new_title)
    title_array = new_title.split
    title_array[0] = title_array[0].capitalize
    @title = title_array[0]

    if title_array.length > 1
      for i in 1..title_array.length-1
         unless (title_array[i] == 'the' or
                 title_array[i] == 'and' or
                 title_array[i] == 'over' or
                 title_array[i] == 'of' or
                 title_array[i] == 'a' or
                 title_array[i] == 'an' or
                 title_array[i] == 'in')
           title_array[i] = title_array[i].capitalize
         end
      end
      @title = title_array.join(' ')
    end
  end
end