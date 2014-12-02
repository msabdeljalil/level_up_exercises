class Bomb
    # TODO: Shoule the codes be instance or class level?
    ACTIVATION_CODE = '1111'
    DEACTIVATION_CODE = '1234'

    attr_accessor :bomb_state 

    def initialize()
        @bomb_state = "Inactive"
    end

    def active?
        @bomb_state == "ACTIVE"
    end

    def activate(code)
        if code == ACTIVATION_CODE
            @bomb_state = "ACTIVE"
        end
    end

    def deactivate(code)
        if code == DEACTIVATION_CODE
            @bomb_state = "inactive"
        end
    end

    def to_s
        @bomb_state
    end
end