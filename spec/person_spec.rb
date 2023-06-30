require_relative '../classes/person'

describe Person do
  subject do
    Person.new(12, 'Hazard', parent_permission: false)
  end

  context '#initialize' do
    it 'should initialize a person' do
      expect(subject.id).to be_kind_of Numeric
      expect(subject.name).to eql 'Hazard'
      expect(subject.parent_permission).to eql false
      expect(subject.age).to eql 12
      expect(subject.rentals).to be_empty
    end
  end

  context '#add_rental' do
    it 'should add rentals' do
      rental1 = double('rental')
      rental2 = double('rental')

      allow(rental1).to receive(:person=)
      allow(rental2).to receive(:person=)

      subject.add_rental(rental1)
      subject.add_rental(rental2)

      expect(subject.rentals.length).to eql 2
    end
  end

  context '#can_use_services?' do
    it 'should not allow a person to use services' do
      person = Person.new(12, 'Hazard', parent_permission: false)
      expect(person.can_use_services?).to be false
    end

    it 'should allow a person to use services' do
      person = Person.new(32, 'Hazard', parent_permission: false)
      expect(person.can_use_services?).to be true
    end
  end

  context '#correct_name' do
    it 'should correct a person\'s name' do
      person = Person.new(32, 'Hazard', parent_permission: false)
      expect(person.correct_name).to eql 'Hazard'
    end
  end
end
