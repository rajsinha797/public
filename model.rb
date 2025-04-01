# Base class for all models
class BaseModel
  attr_accessor :id, :created_at, :updated_at

  def initialize(id, created_at, updated_at)
    @id = id
    @created_at = created_at
    @updated_at = updated_at
  end
end

# User model
class User < BaseModel
  attr_accessor :firstname, :lastname, :email, :phone, :address

  def initialize(id, firstname, lastname, email, phone, address, created_at, updated_at)
    super(id, created_at, updated_at)
    @firstname = firstname
    @lastname = lastname
    @email = email
    @phone = phone
    @address = address
  end
end

# Patient model
class Patient < BaseModel
  attr_accessor :name, :dob, :gender, :allergies, :conditions

  def initialize(id, name, dob, gender, allergies, conditions, created_at, updated_at)
    super(id, created_at, updated_at)
    @name = name
    @dob = dob
    @gender = gender
    @allergies = allergies
    @conditions = conditions
  end
end

# Allergy model
class Allergy < BaseModel
  attr_accessor :substance, :reaction, :severity, :patient

  def initialize(id, substance, reaction, severity, patient, created_at, updated_at)
    super(id, created_at, updated_at)
    @substance = substance
    @reaction = reaction
    @severity = severity
    @patient = patient
  end
end

# Condition model
class Condition < BaseModel
  attr_accessor :name, :severity, :treatment, :patient

  def initialize(id, name, severity, treatment, patient, created_at, updated_at)
    super(id, created_at, updated_at)
    @name = name
    @severity = severity
    @treatment = treatment
    @patient = patient
  end
end

# Appointment model
class Appointment < BaseModel
  attr_accessor :patient, :doctor, :date, :status

  def initialize(id, patient, doctor, date, status, created_at, updated_at)
    super(id, created_at, updated_at)
    @patient = patient
    @doctor = doctor
    @date = date
    @status = status
  end
end

# Provider model
class Provider < BaseModel
  attr_accessor :name, :services, :address

  def initialize(id, name, services, address, created_at, updated_at)
    super(id, created_at, updated_at)
    @name = name
    @services = services
    @address = address
  end
end

# Example linking
patient = Patient.new("1", "John Doe", "1990-01-01", "Male", [], [], "2024-08-01T10:30:00Z", "2024-08-01T11:00:00Z")
allergy = Allergy.new("2", "Penicillin", "Rash", "Mild", patient, "2024-08-01T10:30:00Z", "2024-08-01T11:00:00Z")
condition = Condition.new("3", "Diabetes", "High", "Insulin therapy", patient, "2024-08-01T10:30:00Z", "2024-08-01T11:00:00Z")
appointment = Appointment.new("4", patient, "Dr. Smith", "2024-08-15T10:30:00Z", "Booked", "2024-08-01T10:30:00Z", "2024-08-01T11:00:00Z")
provider = Provider.new("5", "Downtown Clinic", ["General Medicine", "Pediatrics"], "123 Main Street", "2024-08-01T10:30:00Z", "2024-08-01T11:00:00Z")

# Linking data
patient.allergies << allergy
patient.conditions << condition

# Output example
puts "Patient: #{patient.name}, Allergies: #{patient.allergies.map(&:substance).join(', ')}"
puts "Condition: #{condition.name}, Severity: #{condition.severity}"
puts "Appointment with #{appointment.doctor} on #{appointment.date}"
puts "Provider: #{provider.name}, Services: #{provider.services.join(', ')}"
