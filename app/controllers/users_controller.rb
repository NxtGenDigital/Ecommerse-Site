class UsersController < ApplicationController
  skip_before_action :check_session, :only => [:new,:create,:login_form,:login_form_validation, :facebook_login] 
  #after_action :index
  def index
    #if User.all.count > 50
  	@user=User.all
  #else
  #  @user=User.last(5)
  #end
  end

  def new
  	@user=User.new
    @user.build_image
  end

  def create
  	params.permit!
    @user=User.new(params[:user])
    if @user.save
       ApplicationMailer.send_mail(email=@user.email,body="Hi\nYou got registered to the store.\nThankyou,\nStore Manager\nNishi",subject="Welcome to the shrithi store").deliver!
       session[:user_id]=@user.id
       redirect_to :action=>"index"
    else
       render "new"
    end
  end
  def edit
  @user=User.find(params[:id])
  end
  def update
  	params.permit!
  	@user=User.find(params[:id])
  	if @user.update_attributes(params[:user])
       redirect_to :action=>"index"
   else
   	    render "new"
  	end
  end

  def show
  	@user=User.find(params[:id])
  end
  def nishi
    @user=User.find(params[:id])
  end
  def nishi_page
  end
  def manav
    @user=(params[:id])
  end
  def destroy
     @user=User.find(params[:id])
     if @user.delete
      redirect_to :action=>"index"
   else
   	    render "new"  
     end 
  end
  def login_form
  @user=User.new 
  end
  def login_form_validation
    @user=User.find_by_email_and_password(params[:user][:email],params[:user][:password])
    if @user
      session[:user_id]=@user.id
        redirect_to :action=>"index"
      else
        render "login_form"
    end
  end
  def logout
     session[:user_id]=nil
     redirect_to root_path
  end
  def facebook_login
    user = User.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to :action=>"index"
  end
  private
  def params_user
  	params.require(:user).permit  	
  end
end
