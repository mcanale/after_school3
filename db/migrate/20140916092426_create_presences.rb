class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.integer :student_id
      t.date :date
      t.integer :user_id
      t.boolean :present
      #t.integer :subject_ids
      t.string :note
      t.boolean :toilet

      t.timestamps
    end

    create_table :presences_subjects, id: false do |t|
      t.integer :presence_id
      t.integer :subject_id
    end

  end
end
