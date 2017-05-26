=begin
Your task is to make function, which returns the sum of a sequence of integers.

The sequence is defined by 3 non-negative values: begin, end, step.

If begin value is greater than the end, function should returns 0
=end

def sequence_sum(begin_number, end_number, step)
  return 0 if begin_number > end_number
  total = 0
  (begin_number..end_number).step(step) { |number| total += number }
  total
end

def sequence_sum_2(begin_number, end_number, step)
  return 0 if begin_number > end_number
  total = 0
  (begin_number..end_number).step(step, &:+)
  total
end

sequence_sum_2(2, 6, 2)
# utilisation de la Range#step va retourner chaque stepTH nombre du range callé par la méthode.
