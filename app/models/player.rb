class Player < ApplicationRecord
  validates :nickname, presence: true, uniqueness:true
  # before_save { self.colour = "" }
  # before_save { self.piece_on_board = "[]" }
  # before_save { self.piece_pile = 9 }
  # before_save { self.num_pieces_captured = 0 }
  # before_save { self.is_waiting = nil }
end
