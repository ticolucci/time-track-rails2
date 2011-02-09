class TasksController < ApplicationController
  before_filter :login_required
  layout :determine_layout
  
  def index
    @tasks = Task.find_all_by_user_id current_user.id
    @begin_sheet_date = Date.current.beginning_of_month
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.user_id = current_user.id
    if @task.save
      flash[:notice] = "Successfully created task."
      redirect_to tasks_url
    else
      render :action => 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:notice] = "Successfully updated task."
      redirect_to tasks_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Successfully destroyed task."
    redirect_to tasks_url
  end
  
  def time_sheet
    @from_date = Date.civil params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i
    @user = current_user
    @tasks = @user.tasks.select {|t| t.entries.detect {|e| e.begin >= @from_date} }
  end
  
  def time_sheet_download
    @empty_layout = true
    @from_date = Date.civil params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i
    @user = current_user
    @tasks = @user.tasks.select {|t| t.entries.detect {|e| e.begin >= @from_date} }
    response.headers['Content-Type'] = 'text/csv' # I've also seen this for CSV files: 'text/csv; charset=iso-8859-1; header=present'
    response.headers['Content-Disposition'] = "attachment; filename=#{current_user.username}-timesheet.csv"
  end
  
  def determine_layout
    @empty_layout ? nil : 'application'
  end
end
