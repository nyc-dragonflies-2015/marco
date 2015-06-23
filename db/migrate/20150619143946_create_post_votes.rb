class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.integer :score, default: 0 # classy
      t.references :user, index: true, foreign_key: true # Not disagreeing, but why did you do this?  What was your motivation?
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
