class Weapon

    attr_reader :name, :type, :damage

    def initialize(name, type, damage)
        @name = name
        @type = type
        @damage = damage
    end
end