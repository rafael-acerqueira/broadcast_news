require_relative '../../app/services/list_courses_service.rb'

describe ListCoursesService do

  describe '.call' do
    before :each do
      @courses = ListCoursesService.call
    end

    it "returns a array of courses" do
      expect(@courses.is_a? Array).to eql(true)
    end
  end
end
