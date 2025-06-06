class CreateBuilds < ActiveRecord::Migration[8.0]
  def change
    create_table :builds, id: :uuid do |t|
      t.references :launch, null: false, foreign_key: { to_table: :lti_provider_launches }, type: :uuid
      t.references :resource, null: false, foreign_key: { to_table: :resources }, type: :uuid
      t.references :lti_provider_user, null: false, foreign_key: { to_table: :lti_provider_users }, type: :uuid
      t.jsonb      :test_output, null: false, default: '{}'
      t.text       :commit_sha
      t.citext     :username
      t.text       :reponame
      t.text       :source
      t.float      :score
      t.integer    :attempt_number, null: false

      t.timestamps

      t.index [ :resource_id, :lti_provider_user_id, :attempt_number ], unique: true
    end
  end
end
