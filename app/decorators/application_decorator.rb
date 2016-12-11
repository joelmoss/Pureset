class ApplicationDecorator < SimpleDelegator
  attr_accessor :params

  # If `params_or_options` is not a Hash, pass it to the `@params` instance variable as it is.
  # Otherwise, set each member of the hash as its own instance variable.
  def initialize(obj, params = {})
    @params = params
    super obj

    after_initialize
  end

  # Override this in subclasses if you want to call some code immediately after init.
  def after_initialize
  end
end
