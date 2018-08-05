module RrbsProjectsHelperPatch
  extend ActiveSupport::Concern
  unloadable
  included do
    alias_method_chain(:project_settings_tabs, :rrbs)
  end

  def project_settings_tabs_with_rrbs
    tabs = project_settings_tabs_without_rrbs
    action = { name: 'rrbs_booking',
               controller: 'rrbs_settings',
               action: 'edit',
               partial: 'rrbs_settings/show', label: :label_rrbs_booking }
    tabs << action if User.current.allowed_to?(action, @project)
    tabs
  end
end

