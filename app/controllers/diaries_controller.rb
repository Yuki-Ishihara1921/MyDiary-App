class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update]
  def index
    diaries = Diary.all
  end

  def show
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    respond_to do |format|
      if @diary.save
        format.html {redirect_to @diary, notice: '日記ができました'}
      else
        format.html {render :new}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @diary.update(diary_params)
        format.html {redirect_to @diary, notice: '日記を更新しました'}
      else
        format.html {render :edit}
      end
    end
  end

  private
  def set_diary
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:start_time, :title, :content, :user_id)
  end

end
