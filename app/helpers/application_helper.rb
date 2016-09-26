module ApplicationHelper
  def page_title_for_layout
    content_tag(:h1) do
      content_tag(:div, @page_title, class: 'container')
    end
  end

  def page_subtitle_for_layout
    content_tag(:h2) do
      content_tag(:div, @page_subtitle, class: 'container')
    end
  end

  def page_title_for_head
    "#{@page_title} | " if @page_title
  end

  def page_title(text, subtitle: nil)
    @page_title = text
    @page_subtitle = subtitle
  end

  def current_class_for_route(name)
    current_page?(name) ? 'current' : nil
  end

  def current_class_for_controller(name)
    controller_name == name.to_s ? 'current' : nil
  end
end
