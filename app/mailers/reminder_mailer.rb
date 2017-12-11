class ReminderMailer < ApplicationMailer

  def reminder_email(user)
    @user = user
    @restaurants = @user.restaurants.last
    mail(to: @user.email, subject: 'Reminder Email')
  end
    def reminder_emailrecipe(user)
    @user = user
    @recipes = @user.recipes.last
    mail(to: @user.email, subject: 'Reminder Email')

  end

end
