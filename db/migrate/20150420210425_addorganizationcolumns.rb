class Addorganizationcolumns < ActiveRecord::Migration
  def change
    add_column :organizations, :user_status, :string
    add_column :organizations, :referral, :boolean
    add_column :organizations, :watermark_preference, :boolean
    add_column :organizations, :watermark_preference_vendor, :boolean
    add_column :organizations, :activated_date, :date
    add_column :organizations, :terms_conditions, :text

    add_column :organizations, :twitter_id, :string
    add_column :organizations, :facebook_id, :string
    add_column :organizations, :linkedin_id, :string
    add_column :organizations, :esty_id, :string
    add_column :organizations, :instagram_id, :string
    add_column :organizations, :flickr_id, :string
    add_column :organizations, :pinterest_id, :string
    add_column :organizations, :vimeo_id, :string
    add_column :organizations, :google_plus_id, :string
    add_column :organizations, :youtube_id, :string
    add_column :organizations, :tumblr_id, :string
    add_column :organizations, :blog, :string
    add_column :organizations, :established_when, :date
    add_column :organizations, :logo_required, :string
    add_column :organizations, :bio_description, :string
  end
end
