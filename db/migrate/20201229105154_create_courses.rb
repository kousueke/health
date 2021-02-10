class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|

      t.references :user, foreign_key: true
      t.integer    :course_name_id  , null: false
      t.integer    :weight          , null: false
      t.integer    :target_value    , null: false
      t.timestamps
    end
  end
end
