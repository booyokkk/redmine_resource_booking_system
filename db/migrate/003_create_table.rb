class CreateTable < ActiveRecord::Migration
  def self.up
    create_table :rrbs_settings do |t|
      t.column :project_id, :integer
      t.column :tracker_id, :integer
      t.column :custom_field_id_room, :integer
      t.column :custom_field_id_start, :integer
      t.column :custom_field_id_end, :integer
      t.column :issue_status_id_book, :integer
      t.column :issue_status_id_progress, :integer
      t.column :issue_status_id_complete, :integer
      t.column :footer_message, :text
      t.column :updated_on, :datetime
    end
  end

  def self.down
    drop_table :rrbs_settings
  end
end
