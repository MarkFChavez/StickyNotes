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

  def send_email_to_user(note_user, comment_user)
    @greeting = "Hi #{note_user.email},"
    @name = !comment_user.nil? ? comment_user.email : "Someone"
    mail to: note_user.email, subject: "You received a comment!"
  end

  def send_notif(user)
    @greeting = "Sticky Notes"
    @message = "Someone posted a new note."

    mail to: user.email
  end

end
