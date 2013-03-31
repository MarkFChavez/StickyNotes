class Notification < ActionMailer::Base
  default from: "stickynotes@boards.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.send_mail.subject
  #
  def send_mail(contact)
    @greeting = "Hi StickyNotes,"
    @contact = contact

    mail to: "los_populares@yahoo.com"
  end
end
