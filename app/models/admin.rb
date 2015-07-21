class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_paper_trail
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
