require_relative '../classes/teacher'

describe Teacher do
  subject do
    Teacher.new(58, 'French')
  end

  context '#initialize' do
    it 'should intitalize a teacher' do
      expect(subject.name).to eq 'Unknown'
      expect(subject.age).to eq 58
      expect(subject.specialization).to eql 'French'
      expect(subject.parent_permission).to be true
    end
  end

  context '#can_use_services?' do
    it 'should allow a teacher to use services' do
      expect(subject.can_use_services?).to be true
    end
  end
end
