class IncomesController < ApplicationController
  before_action :set_income, only:[ :show, :edit, :update, :destroy]

  def index
    @incomes = current_user.incomes.all
    @income_categories = IncomeCategory.all
  end

  def show
    @user = @income.user
  end

  def new
    @income = current_user.income.new
    @income_categories = IncomeCategory.all
  end

  def edit
  end

  def create
    @income = current_user.incomes.new(income_params)
    if @income.save
      # showページへリダイレクト
      redirect_to @income, notice: "登録完了！"
    else
      render "new"
    end
  end

  def update
    if @income.update(income_params)
      # indexページへリダイレクト
      redirect_to incomes_path, notice: "アップデート成功！"
    else
      render 'edit'
    end
  end
  
  def destroy
    if @income.destroy
      redirect_to incomes_path, notice:"削除しました"
    else
      redirect_to incomes_path, alert: "削除に失敗しました: #{@income.errors.full_messages.join(,)}"
    end
  end

  private
  
  def set_income
    @income = Income.find(params[:id])
  end

  def income_params
    params.require(:income).permit(:memo, :price, :image, :income_category_id, :user_id)
  end
end
