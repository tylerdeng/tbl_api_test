module RailsAdminDSL::Organization
  extend ActiveSupport::Concern

  included do
    rails_admin do
      extend RailsAdminDSL::OrganizationList
      organization_list
      extend RailsAdminDSL::OrganizationEdit
      organization_edit
      extend RailsAdminDSL::OrganizationUpdate
      organization_update
    end
  end
end
