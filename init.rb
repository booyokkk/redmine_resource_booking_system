
Redmine::Plugin.register :redmine_resource_booking_system do
  name 'Redmine Resource Booking System plugin'
  author 'QBurst, Tobias Droste, Akinori Iwasaki'
  description 'Provides a resource booking system with javascript fullcalendar'
  version '0.7.2'
  #requires_redmine version_or_higher: '2.5.0'
  url 'https://github.com/aki360P/redmine_resource_booking_system'
  
  
  project_module :redmine_resource_booking_system do
    permission :rrbs_booking, :rrbs_bookings => 'index'
    permission :rrbs_setting, :rrbs_settings => 'edit'
  end
  
  
  # add tab - project module
  menu :project_menu, :redmine_resource_booking_system, {:controller => 'rrbs_bookings', :action => 'index' }, :caption => :label_rrbs_booking, :param => :project_id
  
  
  # add tab - project module setting
  Rails.configuration.to_prepare do
    require_dependency 'rrbs_projects_helper_patch'
    unless ProjectsHelper.included_modules.include?(RrbsProjectsHelperPatch)
      ProjectsHelper.send(:include, RrbsProjectsHelperPatch)
    end
  end
  
  
end