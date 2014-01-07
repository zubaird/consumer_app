module SessionsHelper


  def sign_in(account)
    remember_token = Account.new_remember_token  
    cookies.permanent[:remember_token] = remember_token # => Place the enuncrypted token in the browser cookiee (special Rails cookies function)
    account.update_attribute(:remember_token, Account.encrypt(remember_token)) # => Save encrypted token to the database in remember_token column
    self.set_current_user = account # => set current user equal to the given user
  end

  def set_current_user=(account)
    @current_user = account
  end

  def current_user
    remember_token = Account.encrypt(cookies[:remember_token])
    @current_user ||= Account.find_by(remember_token: remember_token)
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user?(account) # => this is used in making sure current user is the same as the user requested to be edited/updated (Chapter 9)
    account == current_user
  end

  def employer_user?
    current_user.type == "Employer"
  end

  def sponsor_user?

    current_user.type == "Sponsor"
  end


  def sign_out
    self.set_current_user = nil # => Not necessary because it redirects to destroy, but would be if it did not redirect. 
    cookies.delete(:remember_token)  
  end


  def store_location  # => a.k.a. store_location
    session[:return_to] = request.url if request.get?  #request is a special object that gets the URL of the requested page.
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end


end
