class CreateSocialInterventionDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :social_intervention_domains do |t|
      t.string :description
      t.references :social_intervention_domain_category, 
        foreign_key: true, 
        index: {name: 'social_intervention_domains_category_id'}

      t.timestamps
    end
  end
end
