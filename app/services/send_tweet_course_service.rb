require 'dotenv/load'
require_relative '../../config/twitter'

class SendTweetCourseService

  attr_accessor :courses

  def initialize(course_list)
    @courses = course_list
  end

  def call
    courses.each_with_index do |course, index|
      CLIENT.update("Saiu um novo curso do forno! #{ENV['EADBOX_DOMAIN']}cursos/#{course['course_slug']}")
    end
  end
end
