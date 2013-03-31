class ContactUsController < ApplicationController
  def new
  	@contact_form = ContactForm.new
  end

  def send_email
  	@contact_form = ContactForm.new(params[:contact_form])

  	if @contact_form.valid?
  		Notification.send_mail(@contact_form).deliver
  		redirect_to root_path, notice: "Thanks! Email sent."
  	else
  		redirect_to root_path, alert: "We were unable to send the email. Please try again some other time."
  	end
  end
end
