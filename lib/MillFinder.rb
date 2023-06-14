class MillFinder
    def spot_in_mill(spot, player)
        #horizontal
        visited = Set.new
        to_visit = Set.new
        to_visit.add(spot)

        horizontal_mill = true
        while !to_visit.empty?
            curr = to_visit.to_a.pop
            to_visit.delete(curr)
            
            visited.add(curr)
            if curr.is_vacant == nil || curr.is_vacant&.colour != player.colour
                horizontal_mill = false
                break
            end

            for adj_spot in curr.adj_horiz_spots do
                if !visited.include?(adj_spot) && !to_visit.include?(adj_spot)
                    to_visit.add(adj_spot)
                end
            end
        end

        #vertical
        visited = Set.new
        to_visit = Set.new
        to_visit.add(spot)

        vertical_mill = true
        while !to_visit.empty?
            curr = to_visit.to_a.pop
            to_visit.delete(curr)
            
            visited.add(curr)
            if curr.is_vacant == nil || curr.is_vacant&.colour != player.colour
                vertical_mill = false
                break
            end

            for adj_spot in curr.adj_vert_spots do
                if !visited.include?(adj_spot) && !to_visit.include?(adj_spot)
                    to_visit.add(adj_spot)
                end
            end
        end

        return horizontal_mill || vertical_mill
    end
end