
class Patient
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end


    def self.all
        @@all
    end

    
    def new_appointment(date, doctor)
        # given a date and doctor, creates a new appointment belonging to that patient
        appointment = Appointment.new(date, self, doctor)
    end


    def appointments
        # returns all appointments associated with this Patient
        Appointment.all.select do |appointment|
            appointment.patient == self
            # binding.pry
        end
    end


    def doctors
        # has many doctors through appointments
        appointments.map do |appointment|
            appointment.doctor
        end
    end


end