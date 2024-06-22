class UsersController < ApplicationController
  before_action :authenticate
  before_action :set_user
  before_action :user_outcome_categories, only: [:new, :edit, :update, :destroy]
  before_action :user_income_categories, only:[:new, :edit, :update, :destroy]

  def mypage
    # 年、月の取得
    @year = Date.today.year
    @month = Date.today.month

    # 月毎の収支
    @monthly_incomes = (1..12).map do |month|
      start_date = Date.new(@year, month, 1)
      end_date = start_date.end_of_month
      category_incomes = {}

      IncomeCategory.all.each do |income_category|
        category_income_price = current_user.incomes.where(created_at: start_date..end_date, income_category_id: income_category.id).sum(:price)
        category_incomes[income_category.name] = category_income_price
      end
        {
          month: start_date.strftime("%-m月"),
          total_incomes: current_user.incomes.where(created_at: start_date..end_date).sum(:price),
          category_incomes: category_incomes
        }
    end

    @monthly_outcomes = (1..12).map do |month|
      start_date = Date.new(@year, month, 1)
      end_date = start_date.end_of_month
      category_outcomes = {}

      OutcomeCategory.all.each do |outcome_category|
        category_outcome_price = current_user.outcomes.where(created_at: start_date..end_date, outcome_category_id: outcome_category.id).sum(:price)
        category_outcomes[outcome_category.name] = category_outcome_price
      end
      {
        month: start_date.strftime("%-m月"),
        total_outcomes: current_user.outcomes.where(created_at: start_date..end_date).sum(:price),
        category_outcomes: category_outcomes
      }
    end

    # 収入の総計
    @income_total = current_user.incomes.sum(:price)
    @outcome_total = current_user.outcomes.sum(:price)
    @balance = @income_total - @outcome_total


    # 当月の収支
    current_month_income = @monthly_incomes.find { |income| income[:month] == Date.current.strftime("%-m月") }
    @current_month_income_value = current_month_income[:total_incomes]

    current_month_outcome = @monthly_outcomes.find { |outcome| outcome[:month] == Date.current.strftime("%-m月") }
    @current_month_outcome_value = current_month_outcome[:total_outcomes]

    # 年間収支
    @yearly_incomes_total = @monthly_incomes.sum { |income| income[:total_incomes] }
    @yearly_outcomes_total = @monthly_outcomes.sum { |outcome| outcome[:total_outcomes] }
    @yearly_balance = @yearly_incomes_total - @yearly_outcomes_total
  end

  def calendar
    @incomes = current_user.incomes
    @outcomes = current_user.outcomes
  end

  def new

  end

  def edit
    @category_names = @user.outcome_categories.pluck(:id, :name)
  end

  def update
    if @user.update(user_params)
      redirect_to homes_path, notice: '設定を更新しました。'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.permit(:name)
  end

  def user_outcome_categories
    params.permit(:id, :name, :image, :users_id)
  end

  def user_income_categories
    params.permit(:id, :name, :image, :users_id)
  end
end
