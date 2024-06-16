class UsersController < ApplicationController
  def mypage
    @user = current_user
  end

  def calendar
    @user = current_user
    @incomes = current_user.incomes
    @outcomes = current_user.outcomes
  end


end
