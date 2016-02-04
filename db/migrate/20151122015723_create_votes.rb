class CreateVotes < ActiveRecord::Migration
  def change
  	unless table_exists? :votes
      create_table :votes do |t|
        t.integer :value
        t.references :user, index: true, foreign_key: true
        t.references :post, index: true, foreign_key: true

        t.timestamps null: false
      end
    end
  end
end
