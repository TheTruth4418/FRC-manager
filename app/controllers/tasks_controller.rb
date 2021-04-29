class TasksController < ApplicationController

  include UsersHelper
  before_action :admin_check
  skip_before_action :admin_check, only: [:show, :index, :edit, :update]

  def new
    @team = current_team
    @task = Task.new
    @students = @team.users.students
  end

  def create
    @team = current_team
    @task = Task.new(task_params)
    @students = @team.users.students
    
    if @task.valid? && @team.id == params[:task][:team_id].to_i
      @task = Task.create!(task_params)
      redirect_to task_path(@task)
    else
      render "new"
    end
  end

  def update
    @team = current_team
    @task = Task.find_by_id(params[:id])
    @task.update!(task_params)
    @user = User.find_by_id(@task.user_id)
    redirect_to task_path(@task)
  end

  def show
    @team = current_team
    @task = Task.find_by_id(params[:id])
    @user = current_user
    @student = User.find_by_id(@task.user_id)
  end

  def edit
    @team = current_team
    @task = Task.find_by_id(params[:id])
    @user = User.find_by_id(@task.user_id)
    @students = @team.users.students
    #dont forget the task complete checkbox
  end

  def destroy
    @task = Task.find_by_id(params[:id])
    @task.destroy
    redirect_to team_path(current_team)
  end

  def index
    #list all of the teams tasks here
  end
end
