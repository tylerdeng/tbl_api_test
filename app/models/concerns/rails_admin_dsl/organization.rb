module RailsAdminDSL::Organization extend ActiveSupport::Concern
  included do
  	rails_admin do
      list do
        scopes [:include_addresses]
        field :id do
          label 'ID'
          column_width 40
        end
        field :name do
          label 'Business Name'
          column_width 100
        end
        field :contact_name do
          label 'Contact Name'
          column_width 100
          formatted_value do
            "#{bindings[:object].first_name} #{bindings[:object].last_name}"
          end
        end
        field :type do
          label 'Type'
          column_width 100
        end
        field :city do
          label 'City'
          column_width 100
          formatted_value do
            addresses = bindings[:object].addresses
            addresses[0].city if addresses.present?
          end
        end
        field :state do
          label 'State'
          column_width 100
        end
        field :expiration_date do
          label 'Expiration Date'
          column_width 100
        end
        field :activated_date do
          label 'Last Active'
          column_width 100
        end
      end
      edit do
        field :id do
          hide
        end
        field :type do
          label 'Organization Type*'
          help false
        end
        field :name do
          label 'Organization Name*'
          help false
        end
        field :web_address  do
          label 'Website'
          help false
        end
        field :blog do
          help false
        end
        field :established_when, :enum do
          show
          label 'Year Established'
          help false
          enum do
            year_array = 1980..Time.now.year
            year_time_stamp_array = []
            year_array.reverse_each do |f|
              year_time_stamp_array.push [f, (Time.parse "#{f}-1-1 00:00:00").to_i]
            end
            year_time_stamp_array.push ['Pre-1980', (Time.parse '1970-1-1 00:00:00').to_i]
          end
        end
        field :uuid do
          label 'uuid*'
          help false
        end
      end
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
end
