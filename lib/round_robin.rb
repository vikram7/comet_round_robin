def rotator(array)
  temp = array[0]
  array.delete_at(0)
  array.rotate!(-1).insert(0, temp)
  array
end

def bye_arranger(array)
  array.sort.pop
end

def schedule_tournament(names)
  names << ' ' if names.length % 2 == 1

  output_array = []
  n = (names.length) / 2

  j = 0
  while j <= n + 1
    schedule = []
    i = 0
    while i < n
      schedule << [names[i], names[-i - 1]]
      i += 1
    end

    schedule.map! do |x|
      if x.include?(' ')
        x = [bye_arranger(x)]
      else
        x
      end
    end

    output_array << schedule

    names = rotator(names)
    j += 1
  end

  if names.length == 2
    return [names.combination(2).to_a]
  elsif names.length == 4
    output_array.pop
  end

  output_array
end
