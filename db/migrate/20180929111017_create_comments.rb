class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.datetime :visit_date
      t.time :visit_time
      t.string :comment_type
      t.string :source
      t.string :urgent
      t.string :case_number
      t.string :first_issue
      t.string :first_issue_comment
      t.string :second_issue
      t.string :second_issue_comment
      t.string :third_issue
      t.string :third_issue_comment
      t.string :contact_type
      t.string :visit_type
      t.string :employee_named
      t.string :status, default: "Open"
      t.integer :guest_id
      t.integer :store_id
      t.timestamps
    end
  end
end
