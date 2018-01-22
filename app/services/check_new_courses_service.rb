class CheckNewCoursesService

  attr_reader :courses

  def initialize courses
    @courses = courses
  end

  def call
    courses.select{|course| ((Time.now.to_i - (3600 * 24))..Time.now.to_i).cover?(Time.parse(course["published_at"]).to_i) unless course["published_at"].nil? }
  end
end
