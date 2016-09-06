module PathHelper
  def link_to(name = nil, options = nil, html_options = nil, &block)
    if !block_given? && name.kind_of?(ActiveRecord::Base)
      super name, name.try(:path) || name
    else
      super
    end
  end
end