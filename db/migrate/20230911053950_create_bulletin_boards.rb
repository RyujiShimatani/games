class CreateBulletinBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :bulletin_boards do |t|
      t.integer :customer_id, null: false

      # ゲームのタイトル名
      t.string :title,  null: false

      # 募集内容
      t.text :message, null: false

      t.timestamps
    end
  end
end
