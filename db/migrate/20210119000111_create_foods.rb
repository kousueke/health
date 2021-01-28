class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.references :user              , foreign_key: true
      t.references :course            , foreign_key: true
      t.string     :name              , null: false
      t.integer    :amount_of_protein , null: false
      t.integer    :number            , null: false
      t.timestamps
    end
  end
end