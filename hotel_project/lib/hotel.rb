require_relative "room"



class Hotel

    attr_reader :rooms
    def initialize(name, hash)
        @name = name
        @rooms = Hash.new
        hash.each do |k,v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        newarr = @name.split.map { |word| word.capitalize}
        return newarr.join(" ")
        
    end

    def room_exists?(string)
        if @rooms.has_key?(string)
            return true
        else
            return false
        end
    end

    def check_in(person, roomName)
        if !room_exists?(roomName)
            puts "sorry, room does not exist"
        else
            if @rooms[roomName].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        if @rooms.values.all? {|room| room.full?}
            return false
        else
            return true
        end
    end

    def list_rooms
        @rooms.each do |k,v|
            puts "#{k} * #{v.available_space}"
            
        end
    end
  
end
