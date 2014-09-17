module FieldsHelper

  def field_categories(f)
    return f.select :category, get_field_categories.collect{ |category| [category[:name], category[:id]] }
  end

  def get_field_categories
    return [
      { :id => Field::TEXT_FIELD, :name => "Textbox" },
      { :id => Field::RADIO_BUTTON_FIELD, :name => "Radio Button" },
      { :id => Field::CHECKBOX_FIELD, :name => "Checkbox" }
    ]
  end

end
