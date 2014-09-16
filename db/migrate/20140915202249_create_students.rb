class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.integer :course_id
      t.time :awaited_Mon
      t.time :awaited_Tue
      t.time :awaited_Wed
      t.time :awaited_Thu
      t.time :awaited_Fri
      t.time :awaited_Sat
      t.time :awaited_Sun
      t.string :note

      t.timestamps
    end
  end
end
