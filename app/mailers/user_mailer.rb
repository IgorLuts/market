class UserMailer < ApplicationMailer
  
  def contact_email(contact)
    @contact = contact
    mail(to: ["alexxty7@gmail.com", "i.luts.aot@gmail.com"], :subject => "Website Contact")
  end

  def order_notification order 
    @order = order
    mail(to: ["alexxty7@gmail.com", "i.luts.aot@gmail.com"], :subject => "Order received")
  end
end
