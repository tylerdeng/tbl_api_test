RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)
  config.audit_with :history, User
  config.audit_with :paper_trail, 'Admin', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    history_index
    history_show
  end
  # config.included_models = ['Organization']
end
