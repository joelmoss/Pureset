require 'rails_helper'

# rubocop:disable RSpec/DescribeClass, RSpec/ExpectActual
RSpec.describe 'project routing' do
  it 'show' do
    expect(get: '/some_user/some_project').to route_to(controller: 'projects',
                                                       action: 'show',
                                                       account_id: 'some_user',
                                                       id: 'some_project')
  end

  it 'board' do
    expect(get: '/some_user/some_project/awesome_board').to route_to(controller: 'projects',
                                                                     action: 'show',
                                                                     account_id: 'some_user',
                                                                     project_id: 'some_project',
                                                                     board_name: 'awesome_board')
  end

  it 'index' do
    expect(get: '/some_user/projects').to route_to(controller: 'projects',
                                                   action: 'index',
                                                   account_id: 'some_user')
  end

  it 'new' do
    expect(get: '/some_user/projects/new').to route_to(controller: 'projects',
                                                       action: 'new',
                                                       account_id: 'some_user')
  end

  it 'create' do
    expect(post: '/some_user/projects').to route_to(controller: 'projects',
                                                    action: 'create',
                                                    account_id: 'some_user')
  end
end
