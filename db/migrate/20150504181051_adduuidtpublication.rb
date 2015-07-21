class Adduuidtpublication < ActiveRecord::Migration
  def change
    add_column :publications, :uuid, :uuid, default: 'uuid_generate_v4()'
  end
end
