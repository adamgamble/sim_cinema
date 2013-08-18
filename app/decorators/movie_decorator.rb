class MovieDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end


  def proposals
    object.proposals.decorate
  end

  def state
    object.state.humanize
  end

  def linked_name
    link_to object.name, object
  end

  def budget
    number_to_currency object.budget
  end

  def revenue
    number_to_currency object.revenue
  end

  def profit
    number_to_currency object.profit
  end
end
