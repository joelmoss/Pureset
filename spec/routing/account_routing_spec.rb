require 'rails_helper'

# rubocop:disable RSpec/DescribeClass, RSpec/ExpectActual
RSpec.describe 'account routing' do
  it 'show' do
    expect(get: '/some_user').to route_to(controller: 'accounts',
                                          action: 'show',
                                          id: 'some_user')
  end
end
