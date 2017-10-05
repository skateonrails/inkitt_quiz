class AddFinishedQuizColumnToUsersTable < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :finished_quiz, :boolean, default: false
  end
end
