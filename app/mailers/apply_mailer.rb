class ApplyMailer < ApplicationMailer
  def announce_application(application)
    @applicant = User.find(application.user_id)
    @host = User.find(application.host_id)
    @message = application.body
    @applications_url = ENV['API_DOMAIN'] + '/applications'
    @room_url = ENV['API_DOMAIN'] + "/rooms/#{application.room_id}"
    @top_url = ENV['API_DOMAIN']

    mail(to: @host.email, subject: '【エペスク】参加リクエストが申請されました')
  end
end
