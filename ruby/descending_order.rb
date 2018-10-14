def descending_order(n)
  nString = n.to_s
  processedString = nString.split('')
                           .sort
                           .join('')
                           .reverse
  processedString.to_i
end