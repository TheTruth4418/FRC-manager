class TasksController < ApplicationController

  include UsersHelper

  def new
    @team = current_team
    @task = @team.tasks.build
    @students = @team.users.students
  end

  def create
    @team = current_team
    @task = Task.create!(task_params)
    @user = User.find_by_id(@task.user_id)
    @tasks = @team.tasks
    render "show"
  end

  def update
    @team = current_team
    @task = Task.find_by_id(params[:id])
    @task.update!(task_params)
    @user = User.find_by_id(@task.user_id)
    render "show"
  end

  def show
    @team = current_team
    @task = Task.find_by_id(params[:id])
    @user = User.find_by_id(@task.user_id)
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
