class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      # 好きなゲームのジャンル
      t.string :name, null: false

      # プラットフォーム
      t.string :platform, null: false

      t.timestamps
    end
  end
end
