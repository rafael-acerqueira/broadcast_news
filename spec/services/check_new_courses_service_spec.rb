require_relative '../../app/services/check_new_courses_service.rb'

describe CheckNewCoursesService do

  describe '#call' do
    before :each do
      course_list_json = JSON.parse(File.read("./spec/fixtures/courses.json"))
      @old_course = course_list_json[0]
      @old_course["published_at"] = (Time.at(Time.now.to_i - 3 * 24 * 3600)).to_s

      @new_course_published = course_list_json[1]
      @new_course_published["published_at"] = (Time.at(Time.now.to_i - 1800)).to_s

      @new_course_not_published = course_list_json[2]
      @new_course_not_published["published_at"] = (Time.at(Time.now.to_i + 1 * 24 * 3600)).to_s
      @new_course_not_published["published"] = "false"

      course_list = [@old_course, @new_course_published, @new_course_not_published]
      
      check_new_courses = CheckNewCoursesService.new(course_list)
      @new_courses = check_new_courses.call
    end

    it "return a array with courses with published_at between yesterday and today include the time when I ask for it" do
      expect(@new_courses).to include(@new_course_published)
    end

    it "return a array without courses with published_at more than today include the time when I ask for it" do
      expect(@new_courses).to_not include(@new_course_not_published)
    end

    it "return a array without courses with published_at less than yesterday in exact time when I ask for it" do
      expect(@new_courses).to_not include(@old_course)
    end
  end
end
