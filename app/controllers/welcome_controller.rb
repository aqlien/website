class WelcomeController < ApplicationController

  def contact
  end

  def message
    FeedbackMailer.contact_me(params[:name], params[:email], params[:message]).deliver
    redirect_to root_path, notice: "Email sent!"
  end
end
