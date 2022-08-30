class MatchingMailer < ApplicationMailer
  def announce_application_accepted(agreement)
    @applicant = User.find(agreement.applicant_id)
    @host = User.find(agreement.user_id)
    @message = agreement.body
    @url = ENV['API_DOMAIN'] + "/rooms/#{agreement.room_id}"
    @top_url = ENV['API_DOMAIN']

    mail(to: @applicant.email, subject: '【エペスク】参加リクエストが承認されました')
  end
end
