class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.user_id = @user.id if (@user.respond_to?('id')) && (@user.respond_to?('user_id'))
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
  def test
    render :text => %q{
    
   <p> Nice try! Hey, here is a game related hint for your troubles:</p>
    
   <p> "Know your roles" </p>
    
    <p>and ...</p>
    
    <p>a = (0..4), a.each_with_idx do {|i, ix| "w00t" if ix == a.first}</p>
    }
  end

end
