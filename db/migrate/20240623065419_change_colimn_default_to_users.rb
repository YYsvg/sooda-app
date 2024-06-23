class ChangeColimnDefaultToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :goal_price, from: nil, to: "0"
  end
end
