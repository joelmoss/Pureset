module ApplicationHelper
  def icon(*names, id: nil)
    content_tag :i, nil, class: names.map { |name| name.to_s.tr('_', '-') } << 'icon', id: id
  end

  def page_title_for_layout
    if @page_title
      content_tag :h1 do
        content_tag :div, @page_title, class: 'container'
      end
    end
  end

  def page_title_for_head
    "#{@page_title} | " if @page_title
  end

  def page_title(text)
    @page_title = text
  end
end
