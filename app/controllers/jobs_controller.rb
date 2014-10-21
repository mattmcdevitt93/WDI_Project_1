class JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_job, only: [:show, :edit, :update, :destroy]


  def index
    @jobs = Job.all
    @events = Event.all
  end

  def new
    @job = Job.new
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def create
    @job = Job.new(event_params)

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
      format.html { redirect_to events_url, notice: 'Job was successfully destroyed.' }
    end
  end

private

    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:descrpition).permit(:user_id, :event_id)
    end

end
