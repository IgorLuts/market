class UserMailer < ApplicationMailer
  
 def contact_email(contact)
    @contact = contact
    mail(to: "alexxty7@gmail.com", :subject => "Website Contact")
  end
end
