class Field < ActiveRecord::Base

  TEXT_FIELD = 1
  RADIO_BUTTON_FIELD = 2
  CHECKBOX_FIELD = 3

  attr_accessible :category, :name, :options

  belongs_to :form

  def radio?
    self.category === RADIO_BUTTON_FIELD
  end

  def stats(answers, total, option)
    {
      :percent => ( answers.size.to_f / total.to_f ) * 100.00,
      :size => answers.size
    }
    
  end

end
