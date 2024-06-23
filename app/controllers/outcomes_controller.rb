class OutcomesController < ApplicationController
  before_action :authenticate
  before_action :set_outcome, only: %w(edit update destroy)

  def index
    @outcomes = current_user.outcomes.all
    @outcome_categories = OutcomeCategory.all
  end

  # def show
    # @user = @outcome.user
  # end

  def new
    @outcome = current_user.outcome.new
    @outcome_categories = OutcomeCategory.all
  end

  def edit
  end

  def create
    @outcome = current_user.outcomes.new(outcome_params)
    if @outcome.save
      redirect_to homes_path, notice: "登録完了！"
    else
      render "new"
    end
  end

  def update
    if @outcome.update(outcome_params)
      redirect_to mypage_calendar_users_path, notice: "アップデート成功！"
    else
      render 'edit'
    end
  end

  def destroy
    if @outcome.destroy
      redirect_to mypage_calendar_users_path, notice: "削除しました"
    else
      redirect_to outcomes_path, alert: "削除に失敗しました: #{@outcome.errors.full_messages.join(',')}"
    end
  end

  private

  def set_outcome
    @outcome = Outcome.find(params[:id])
  end

  def outcome_params
    params.require(:outcome).permit(:memo, :price, :image, :outcome_category_id, :user_id)
  end

end
