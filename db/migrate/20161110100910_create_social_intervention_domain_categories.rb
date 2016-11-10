class CreateSocialInterventionDomainCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :social_intervention_domain_categories do |t|
      t.string :description

      t.timestamps
    end
  end
end
