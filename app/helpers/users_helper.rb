module UsersHelper

# Confirm
def confirm_params
  params.require(:confirm).permit(
      :id,
      :grades,
      :user_id,
      :event_id
  )
  end

  def confirmed?(event, user)
    confirm = Confirm.find_by(event_id: event.id, user_id: user.id)
    if confirm 
        confirm.grades == 1 ? "Not Qualified" : "Qualified"
    else
        "No Confrirm on file"
    end
  end

  def find_confirm(event,user)
   confirm = Confirm.find_by(event_id: event.id, user_id: user.id)
  end

  def passing(confirm)
   confirm.grade == 0 ? "Not Qualified" : "Qualified"
  end

# Event
  def event_params
      params.require(:event).permit(:id,:name, :date, :location, :team_id)
  end

  def scout(aspect) 
      aspect == 0 ? "No" : "Yes"
  end

# Participant
  def participant_params
      params.require(:participant).permit(
      :id,
      :name,
      :team_number,
      :robot_status,
      :autonomous,
      :scoring,
      :climbing,
      :event_id
      )
  end

# Task
  def task_params 
      params.require(:task).permit(
      :id,
      :name,
      :description,
      :complete,
      :user_id,
      :team_id
      )
  end

# Team
  def team_params
      params.require(:team).permit(:id,:name, :admin_id)
  end

  def admin?
      current_user.admin == 1
  end

  def admin_check
      unless admin?
      flash[:notice] = "Admin can only access this page"
      redirect_to user_url(current_user)
      end
  end

  def current_team
      @current_team = Team.find_by_id(current_user.team_id)
  end

  def status(user)
      current_user.admin == 1 ? "admin" : "student"
  end

  def students_check
    @event = Event.find_by(params[:event_id])
    unless current_team.users.students.length > 0
      flash[:notice]= "Cannot make a confirm without students on file!"
      redirect_to event_path(@event)
    end
  end

# User

  def user_params
      params.require(:user).permit(:id,:username, :password, :admin, :team_id)
  end

  def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def login_check
      unless logged_in?
      flash[:notice] = "Please Log in before accessing!"
      redirect_to "/"
      end
  end

  def logged_in?
      !!session[:user_id]
  end

  def on_team?(user)
      current_user.team_id != nil 
  end

# Auth
  def auth
      request.env['omniauth.auth']
  end

  def auth_username(email)
      index = email.index('@')
      email[0,index]
  end
end