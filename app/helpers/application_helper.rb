module ApplicationHelper
  def unidade(string)
    case string
    when "UN"
      "Unidade"
    when "DZ"
      "Dúzia"
    when "KG"
      "Kilo"
    end
  end
end
