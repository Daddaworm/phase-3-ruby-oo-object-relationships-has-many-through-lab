require 'pry'

class Doctor
    attr_accessor :name

    @@all = []


    def initialize(name)
        @name = name
        @@all << self
    end


    def self.all
        @@all
    end


    def new_appointment(date, patient)
        # given a date and a patient, creates a new appointment
        appointment = Appointment.new(date, patient, self)
    end


    def appointments
        # returns all appointments associated with this Doctor
        Appointment.all.select do |appointment|
            appointment.doctor == self
            # binding.pry
        end
    end


    def patients
        # has many patients, through appointments
        appointments.map do |appointment|
            appointment.patient
            # binding.pry
        end
    end

end