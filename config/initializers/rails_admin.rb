RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  config.show_gravatar = true
  config.label_methods = [:to_s]
  config.parent_controller = 'ApplicationController'

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model User do
    visible false
  end

  config.model Student do
    object_label_method :full_name
    exclude_fields :reset_password_sent_at, :remember_created_at
  end
  config.model Teacher do
    object_label_method :full_name
    edit do
      exclude_fields :lessons, :date_of_birth, :group_id, :reset_password_sent_at, :remember_created_at
    end
    list do
      field :id
      field :first_name
      field :last_name
      field :email
      field :lessons
      field :type
      field :created_at
      field :updated_at
      field :reset_password_sent_at
    end
  end
  config.model Admin do
    object_label_method :full_name
    exclude_fields :date_of_birth, :group_id, :reset_password_sent_at, :remember_created_at
    
  end
  
  config.model Group do
    object_label_method :group_number
    exclude_fields :lessons, :students
  end

  config.model Lesson do
    list do
      field :id
      field :subject
      field :hour
      field :teacher
      field :group
      field :monday
      field :tuesday
      field :wednesday
      field :thursday
      field :friday
      field :created_at
      field :updated_at
    end
  end

end
