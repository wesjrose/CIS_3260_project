
class Spot1

    def initialize(x_coord, y_coord)
        @x_coord = x_coord
        @y_coord = y_coord
        @adj_horiz_spots = []
        @adj_vert_spots = []
        @occupant = nil

        @spot_id = nil
    end
    attr_accessor :x_coord, :y_coord, :adj_horiz_spots, :adj_vert_spots, :occupant,


    def is_vacant()
        return @occupant
    end

    def set_occupant(piece)
        @occupant = piece
    end

    def remove_occupant()
        @occupant = nil
    end

    def add_horiz(horiz_spot)
        @adj_horiz_spots.append(horiz_spot)
    end

    def add_vert(vert_spot)
        @adj_vert_spots.append(vert_spot)
    end

    
    def set_spot_id(id)
        @spot_id = id
    end

    def get_spot_id()
        return @spot_id
    end
    
    def get_vert_spots()
        return @adj_vert_spots
    end

end
