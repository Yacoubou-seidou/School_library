require_relative '../classes/student'

describe Student do
  let(:first_classroom) { double('classroom') }
  let(:second_classroom) { double('classroom') }
  subject { Student.new(11, first_classroom) }

  context '#initialize' do
    it 'should initialize a student' do
      expect(subject.id).to be_kind_of Numeric
      expect(subject.age).to eq 11
      expect(subject.name).to eq 'Unknown'
      expect(subject.parent_permission).to eq true
      expect(subject.classroom).to eq(first_classroom)
    end
  end

  context '#classroom=' do
    it 'should add student to an existing classroom' do
      students = []
      allow(second_classroom).to receive(:students).and_return(students)
      allow(second_classroom).to receive(:students=)
      subject.classroom = second_classroom
      expect(students).to include(subject)
    end
  end

  context '#play_hooky' do
    it 'should allow a student play hooky' do
      expect(subject.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
