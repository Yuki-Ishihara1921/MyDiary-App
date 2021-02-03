class DiariesController < ApplicationController
  before_action :set_current_user
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  
  def index
    diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    respond_to do |format|
      if @diary.save
        format.html {redirect_to @diary, notice: '日記を作成しました！'}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @diary.update(diary_params)
        format.html {redirect_to @diary, notice: '日記を更新しました！'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @diary.destroy
    respond_to do |format|
      format.html {redirect_to root_path, notice: '日記を削除しました！'}
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
