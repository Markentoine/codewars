def get_los_angeles_points(results)
  sum = 0
  results.each do |subarray|
    if subarray[0].match(/\ALos Angeles [A-Z][a-z]+\z/)
      sum += subarray[1].scan(/\d+/).first.to_i
    end
  end
  sum
end