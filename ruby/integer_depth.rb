def compute_depth n
  existing_digits = []
  depth = 0
  while (existing_digits.length < 10) do
    depth += 1
    multiple = (n * depth)
    multiple_digits = multiple.to_s
                              .split('')
                              .map(&:to_i)
                              .each do |digit|
                                if (!existing_digits.include?(digit))
                                    existing_digits.push(digit)
                                end
                              end
  end
  depth
end

p compute_depth(42)