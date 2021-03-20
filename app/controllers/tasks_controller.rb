class TasksController < ApplicationController
  def new
    @task = current_user.team.tasks.build
    @students = @team.users.students
  end

  def create
    @team = current_team
    @task = Task.create!(task_params)
    @tasks = @team.tasks
    #render "index"
  end

  def update
    @task = Task.find_by_id(params[:id])
    @task.update(task_params)
    # render show
  end

  def show
    @task = Task.find_by_id(params[:id])
    @user = User.find_by_id(params[:user_id])
  end

  def edit
    @task = Task.find_by_id(params[:id])
    @students = @team.users.students
    #dont forget the task complete checkbox
  end

  def destroy
    @task = Task.find_by_id(params[:id])
    @task.destroy
    # return to the previous screen
  end

  def index
    #list all of the teams tasks here
  end
end
