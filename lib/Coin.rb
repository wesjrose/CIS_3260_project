class Coin
    def initialize()
        @result = nil
    end
    attr_accessor :result

    def flip()
        result = Random.rand(2) # 0, 1
        if result == 0
            @result = :T
        else
            @result = :H
        end
    end
end