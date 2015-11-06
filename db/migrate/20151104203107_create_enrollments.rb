class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :user, index: true
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :enrollments, :users
    add_foreign_key :enrollments, :articles
  end
end
