

class Piece1

    def initialize(colour, owner)
        @owner = owner
        @colour = colour
        @occupied_spot = nil
    end
    attr_accessor :owner, :colour, :occupied_spot
end