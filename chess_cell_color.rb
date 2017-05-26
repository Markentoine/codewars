#method to know if two cells of a chess board have the same color

def chessboard_cell_color(cell1, cell2)
  chess_board = ('A'..'H').to_a.product((1..9).to_a)
  chess_board.index(cell1.chars).even? == chess_board.index(cell21.chars).even?
end