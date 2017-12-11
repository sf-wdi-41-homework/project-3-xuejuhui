class ReminderMailer < ApplicationMailer

  def reminder_email(user)
    @user = user
    @restaurants = @user.restaurants.last
    mail(to: @user.email, subject: 'Reminder Email')
  end
end
