class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      # 好きなゲームのジャンル
      t.string :name

      # プラットフォーム
      t.string :platform

      t.timestamps
    end
  end
end
