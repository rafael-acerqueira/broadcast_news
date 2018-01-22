require 'rest-client'
require 'json'
require 'dotenv/load'

class ListCoursesService

  def self.call
    begin
      authenticated_user = RestClient.post "#{ENV['EADBOX_DOMAIN']}api/login", {email: ENV['EADBOX_EMAIL'], password: ENV['EADBOX_PASSWORD']}
      authentication_token = JSON.parse(authenticated_user.body)['authentication_token']
      res = RestClient.get "#{ENV['EADBOX_DOMAIN']}api/admin/courses?auth_token=#{authentication_token}"
      JSON.parse(res.body)  
    rescue
      puts 'Problem with API'
    end
  end
end
