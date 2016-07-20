
class Person
  attr_reader :first_name, :middle_name, :last_name
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    if middle_name == nil
      first_name + ' ' + last_name
    else
      first_name + ' ' + middle_name + ' ' + last_name
    end
  end

  def full_name_with_middle_initial
    if middle_name == nil
      first_name + ' ' + last_name
    else
      first_name + ' ' + middle_name[0] + '.' + ' ' + last_name
    end
  end

  def initials
    if middle_name == nil
      first_name[0] + '. ' + last_name[0] + '.'
    else
      first_name[0] + '. ' + middle_name[0] + '. ' + last_name[0] + '.'
    end
  end
end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      full = 'Chuck Sidekick Norris'
      chuck = create_person_with_middle_name
      
      expect(chuck.full_name).to eq(full)
    end

    it "does not add extra spaces if middle name is missing" do
      full = 'Chuck Norris'
      chuck = create_person_without_middle_name
      
      expect(chuck.full_name).to eq(full)
    end
  end

  describe "#full_name_with_middle_initial" do
    it "concatenates first name, middle initial, and last name with spaces" do
      full = 'Chuck S. Norris'
      chuck = create_person_with_middle_name
      
      expect(chuck.full_name_with_middle_initial).to eq(full)
    end

    it "does not add extra spaces if middle name is missing" do
      full = 'Chuck Norris'
      chuck = create_person_without_middle_name
      
      expect(chuck.full_name_with_middle_initial).to eq(full)
    end
  end

  describe "#initials" do
    it "concatenates the first, middle, and last name initials with spaces" do
      name_initials = 'C. S. N.'
      chuck = create_person_with_middle_name
      
      expect(chuck.initials).to eq(name_initials)
    end

    it "does not add extra spaces if middle name is missing" do
      name_initials = 'C. N.'
      chuck = create_person_without_middle_name
      
      expect(chuck.initials).to eq(name_initials)
    end
  end

  def create_person_with_middle_name
    Person.new(first_name: 'Chuck', middle_name: 'Sidekick', last_name: 'Norris')
  end

  def create_person_without_middle_name
    Person.new(first_name: 'Chuck', last_name: 'Norris')
  end
end
