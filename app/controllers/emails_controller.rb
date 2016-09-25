class EmailsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @email = Email.all
  end

  def create
    @email = Email.new(email_params)
    if @email.save

      flash[:success] = "You should now recieve emails from News By Hannah! Email weissp68@stanford.edu to cancel."
      redirect_to root_path
      HannahMailer.news_email("Add email: #{@email.email}", "", "philipfweiss@gmail.com").deliver_now


    else
      flash[:failure] = "Failure!"
      redirect_to root_path
    end
  end

  private

  def email_params
    params.require(:email).permit(:email)
  end

end
