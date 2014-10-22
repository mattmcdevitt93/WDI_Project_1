class JobsController < ApplicationController
    before_action :authenticate_user!
    # before_action :set_job, only: [:show, :edit, :update, :destroy]


  def index
    @jobs = Job.where(user_id: current_user.id)
    @events = Event.all
    @team_hours = Event.hours_this_month_for_user(current_user, 'Team Event')
    @org_hours = 4
    @total_hours = @team_hours + @org_hours
  end

  def new
    @job = Job.new
    @events = Event.all
    @count = Event.count
    @date = Time.now
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Job was successfully destroyed.' }
    end
  end

private

    def set_job
      @job = Job.find(params[:user_id])
    end

    def job_params
      params.require(:job).permit(:user_id, :event_id)
    end

end
