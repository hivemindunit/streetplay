class AddUserParticipates < ActiveRecord::Migration[5.0]
  create_table :user_participates, id: false do |t|
    t.belongs_to :user, index: true
    t.belongs_to :activity, index: true
  end
end
