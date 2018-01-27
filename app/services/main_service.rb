require_relative './list_courses_service.rb'
require_relative './check_new_courses_service.rb'
require_relative './send_tweet_course_service.rb'

class MainService

  def self.call
    course_list = ListCoursesService.call
    if course_list
      check_new = CheckNewCoursesService.new(course_list)
      new_courses = check_new.call
      send_tweet = SendTweetCourseService.new(new_courses)
      send_tweet.call
    else
      puts 'Without new courses'
    end
  end
end
