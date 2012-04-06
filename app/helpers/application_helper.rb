module ApplicationHelper
  def menu_link_to(item)
    if current_page?(item[:link])
      raw '<span  class="current_page">'  + item[:name] + '</span>'
    elsif item[:disabled]
      raw '<span  class="disabled">'  + item[:name] + '</span>'
    else
      link_to(item[:name],  item[:link])
    end
  end
end

