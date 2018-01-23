class CreateBoardUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :board_users do |t|
      t.belongs_to :board
      t.belongs_to :user
      t.boolean :completed

      t.timestamps
    end
  end
end
