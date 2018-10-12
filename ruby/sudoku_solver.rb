=begin
I had just finished a kata for checking sudoku solutions and wanted a bit more of a challenge, 
I hope to build a fully working sudoku do-er thing in ruby and figured I'd make some new kata at the same time.

The first is nice and simple, there will be only one element missing from each row of the board, 
eventually we'll move on to much more complex puzzles.
=end

def sudokuer(puzzle)
  
end

sudokuer(    [ [4, 5, 0, 3, 9, 1, 8, 7, 6], 
               [3, 1, 0, 6, 7, 5, 2, 9, 4], 
               [6, 7, 0, 4, 2, 8, 3, 1, 5], 
               [8, 3, 0, 5, 6, 4, 7, 2, 9], 
               [2, 4, 0, 9, 8, 7, 1, 6, 3], 
               [9, 6, 0, 2, 1, 3, 5, 4, 8], 
               [7, 9, 0, 8, 5, 2, 4, 3, 1], 
               [1, 8, 0, 7, 4, 9, 6, 5, 2], 
               [5, 2, 0, 1, 3, 6, 9, 8, 7]]) == [[4, 5, 2, 3, 9, 1, 8, 7, 6], 
                                                 [3, 1, 8, 6, 7, 5, 2, 9, 4], 
                                                 [6, 7, 9, 4, 2, 8, 3, 1, 5], 
                                                 [8, 3, 1, 5, 6, 4, 7, 2, 9], 
                                                 [2, 4, 5, 9, 8, 7, 1, 6, 3], 
                                                 [9, 6, 7, 2, 1, 3, 5, 4, 8], 
                                                 [7, 9, 6, 8, 5, 2, 4, 3, 1], 
                                                 [1, 8, 3, 7, 4, 9, 6, 5, 2], 
                                                 [5, 2, 4, 1, 3, 6, 9, 8, 7]]
