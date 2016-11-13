class AddSectionDivisionGroupClaszToIndustryClassifications < ActiveRecord::Migration[5.0]
  def change
    add_column :industry_classifications, :section, :string
    add_column :industry_classifications, :division, :string
    add_column :industry_classifications, :group, :string
    rename_column :industry_classifications, :code, :clasz # not `class` because it's a ruby keyword
  end
end
