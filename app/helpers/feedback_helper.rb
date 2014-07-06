module FeedbackHelper

  def parse_field_html(f)
    if(f.category === Field::TEXT_FIELD)
      return text_field_tag("field_#{f.id}")
    elsif(f.category === Field::RADIO_BUTTON_FIELD)
      html = ""
      f.options.split(",").each do |option|
        html += radio_button_tag("field_#{f.id}", option.strip)
        html += label_tag("field_#{f.id}", option.strip)
      end

      return raw(html)
    elsif(f.category === Field::CHECKBOX_FIELD)
      html = ""
      f.options.split(",").each do |option|
        html += check_box_tag("field_#{f.id}[]", option.strip)
        html += label_tag("field_#{f.id}_label", option.strip)
      end

      return raw(html)
    end
  end

end
