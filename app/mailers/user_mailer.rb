class UserMailer < ApplicationMailer
  
 def contact_email(contact)
    @contact = contact
    mail(to: "admin@ладас.укр", from: @contact.email, :subject => "Website Contact")
  end
end
