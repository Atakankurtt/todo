require 'byebug'
class Item
    def self.valid_date?(date_string)
        month = date_string[5..6].to_i
        day = date_string[8..-1].to_i
        return false if month < 1 || month > 12
        return false if day < 1 || day > 31
        true
    end

    attr_reader :deadline, :done
    attr_accessor :title, :description

    def initialize(title, deadline, description)
        raise "error" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
        @done = false
        
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "error"
        end
    end

    def toggle
        @done = !@done
    end
end