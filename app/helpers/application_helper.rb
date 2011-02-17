module ApplicationHelper
  def title name
    "<h1>#{name}</h1>"
  end
  
  def set_focus_on(id)
    javascript_tag("$('#{id}').focus()");
  end
end
