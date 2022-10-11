require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []

    end

    def valid_title?(string)
        if @salaries.has_key?(string)
            return true
        else
            return false
        end
    end

    def >(otherstartup)
        if @funding > otherstartup.funding
            return true
        else
            return false
        end
    end

    def hire(string, title)
        if valid_title?(title)
            
            @employees << Employee.new(string, title)
        else 
            raise "error"
        end
    end

    def size
        @employees.length
    end
    
    def pay_employee(employee)
        if @funding > @salaries[employee.title]
            employee.pay(salaries[employee.title])
            @funding -= salaries[employee.title]
        else
            raise "error"
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        total = 0
        @employees.each do |employee|
            total += @salaries[employee.title]
        end
        return total / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(otherstartup)
        @funding += otherstartup.funding
        otherstartup.salaries.each do |k,v|
            if !@salaries.has_key?(k)
                @salaries[k] = v
            end
        end
        otherstartup.employees.each do |emp|
            @employees << emp
        end
        otherstartup.close
    end

end
