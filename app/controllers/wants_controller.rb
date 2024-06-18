class WantsController < ApplicationController
  before_action :authenticate
  before_action :set_want, only:[ :show, :edit, :update, :destroy ]

  def index
    @wants = Want.all
  end

  def show
  end

  def new
    @want = current_user.wants.new
  end

  def create
    @want = current_user.wants.new(want_params)
    if @want.save
      redirect_to wants_path, notice: "保存しました"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @want.update(want_params)
      redirect_to wants_path, notice: "修正しました"
    else
      render 'edit'
    end
  end

  def destroy
    if @want.destroy
      redirect_to wants_path, notice: "削除しました"
    else
      redirect_to wants_path, alert: "削除に失敗しました: #{@want.errors.full_messages.join(',')}"
    end
  end

    private

    def set_want
      @want = Want.find(params[:id])
    end

    def want_params
      params.require(:want).permit(:memo, :image, :user_id)
    end
end
