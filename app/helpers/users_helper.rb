module UsersHelper
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
      end 

      def user_params
         params.require(:user).permit(:id,:username, :password, :admin)
      end

      def team_params
        params.require(:team).permit(:id,:name, :admin_id)
      end

      def logged_in?
        !!session[:user_id]
      end

      def on_team?(user)
        current_user.team_id != nil 
      end

      def current_team
        @current_team = Team.find_by_id(current_user.team_id)
      end

      def admin?
        current_user.admin == 1
      end

      def status(user)
        current_user.admin == 1 ? "admin" : "student"
      end

      def event_params
        params.require(:event).permit(:id,:name, :date, :location, :team_id)
     end

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

     def scout(aspect) 
      aspect == 0 ? "No" : "Yes"
     end

     def passing(confirm)
      confirm.grade == 0 ? "Not Qualified" : "Qualified"
     end

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

     def able(arg)
      if arg == 1 
        "Yes"
      else
        "No"
      end
     end

     def find_confirm(event,user)
      confirm = Confirm.find_by(event_id: event.id, user_id: user.id)
     end

end