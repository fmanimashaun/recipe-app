module ApplicationHelper
  def convert_unit(unit)
    case unit
    when 'g'
      'grams'
    when 'l'
      'litres'
    when 'units'
      'units'
    else
      unit
    end
  end
end
