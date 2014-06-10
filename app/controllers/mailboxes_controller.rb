class MailboxesController < ApplicationController

  # GET /message/new
  def new
    # display form
  end

  # POST /message/create
  def create
    @recipient = Account.find(params[:recipient_id])  #receiver_id?
    current_user.send_message(@recipient, params[:body], params[:subject])

    if current_user.type == "Sponsor"
    redirect_to sponsor_path(current_user)
    elsif current_user.type == "Employer"
    redirect_to employer_path(current_user)
    end
  end
end