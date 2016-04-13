module ApplicationHelper
  def icon(*names, id: nil)
    content_tag :i, nil, class: names.map { |name| name.to_s.tr('_', '-') } << 'icon', id: id
  end
end
