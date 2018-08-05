class RrbsSetting < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable
  belongs_to :project

  validates_uniqueness_of :project_id
  validates :project_id, presence: true
  
  attr_accessible :tracker_id
  attr_accessible :custom_field_id_room, :custom_field_id_start, :custom_field_id_end
  attr_accessible :issue_status_id_book, :issue_status_id_progress, :issue_status_id_complete
  attr_accessible :footer_message



  def self.find_or_create(project_id)
    rrbs_setting = RrbsSetting.where(['project_id = ?', project_id]).first
    
    
    unless rrbs_setting.present?
      rrbs_setting =RrbsSetting.new
      rrbs_setting.project_id = project_id
      
      # Set default
      rrbs_setting.tracker_id = '1'
      rrbs_setting.custom_field_id_room = '1'
      rrbs_setting.custom_field_id_start = '2'
      rrbs_setting.custom_field_id_end = '3'
      rrbs_setting.issue_status_id_book = '1'
      rrbs_setting.issue_status_id_progress = '2'
      rrbs_setting.issue_status_id_complete = '3'
      rrbs_setting.footer_message = ''
            
      rrbs_setting.save!
    end
    rrbs_setting
  end

end
