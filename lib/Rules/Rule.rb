class Rule
    
    def applicable?(game, current_spot, destination_spot)
        raise NotImplementedError
    end

    def valid?(game, current_spot, destination_spot)
        raise NotImplementedError
    end
end
