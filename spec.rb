
class Person
  attr_reader :first_name, :middle_name, :last_name, :name
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
    @name = [first_name, middle_name, last_name]
  end

  def name_array
    name.select! {|n| n != nil }
    name
  end

  def full_name
    name_array.join(' ')
  end

  def full_name_with_middle_initial
    if name_array.size > 2
      name_array[1] = middle_name[0] + '.'
    end
    full_name
  end

  def initials
    name_array.map { |name| name[0] + '.'}.join(' ')
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
