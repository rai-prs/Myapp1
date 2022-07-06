class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_url, notice: "スケジュールを登録しました"
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_url, notice: "スケジュールを更新しました"
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_url, notice: "スケジュール「#{event.title}」を削除しました。"
  end

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :all_day, :memo)
  end  
end
