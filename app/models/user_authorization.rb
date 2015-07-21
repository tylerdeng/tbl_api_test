class UserAuthorization < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :token, presence: true
  validates :type,
            presence: true,
            uniqueness: { scope: :user },
            inclusion: { in: Rails.configuration.user_authorization_type[:type] }

  self.inheritance_column = :_type_disabled
end
