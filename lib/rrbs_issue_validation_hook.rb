module RrbsIssueValidationHook
  class Hooks < Redmine::Hook::Listener
  
    def controller_issues_new_before_save(context={})
      #raise ::Unauthorized
    end
  end
end