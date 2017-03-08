class UserMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact
    mail(to: ['alexxty7@gmail.com', 'i.luts.aot@gmail.com'], subject: 'Website Contact')
  end

  def order_notification(order)
    @order = order
    mail(to: ['alexxty7@gmail.com', 'i.luts.aot@gmail.com'], subject: 'Order received')
  end

  def callback(contact)
    @contact = contact
    mail(to: ['alexxty7@gmail.com', 'i.luts.aot@gmail.com'], subject: 'Callback')
  end

  def comment_notification(comment)
    @comment = comment
    mail(to: ['alexxty7@gmail.com', 'i.luts.aot@gmail.com'], subject: 'Comment received')
  end
end
