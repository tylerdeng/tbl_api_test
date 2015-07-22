module RailsAdminDSL::OrganizationUpdate
  def organization_update
    update do
      field :id do
        show
        label 'Organization Id'
        read_only true
        help false
      end
      field :type do
        read_only true
      end
    end
  end
end
