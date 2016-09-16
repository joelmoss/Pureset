require 'rails_helper'

# rubocop:disable RSpec/DescribeClass, RSpec/ExpectActual
RSpec.describe 'task routing' do
  context 'account tasks' do
    it 'show' do
      expect(get: '/some_user/37').to route_to(controller: 'tasks',
                                               action: 'show',
                                               account_id: 'some_user',
                                               id: '37')
    end

    it 'new' do
      expect(get: '/some_user/tasks/new').to route_to(controller: 'tasks',
                                                      action: 'new',
                                                      account_id: 'some_user')
    end

    it 'create' do
      expect(post: '/some_user/tasks').to route_to(controller: 'tasks',
                                                   action: 'create',
                                                   account_id: 'some_user')
    end
  end

  context 'project tasks' do
    it 'show' do
      expect(get: '/some_user/some_project/37').to route_to(controller: 'tasks',
                                                            action: 'show',
                                                            account_id: 'some_user',
                                                            project_id: 'some_project',
                                                            id: '37')
    end

    it 'new' do
      expect(get: '/some_user/some_project/tasks/new').to route_to(controller: 'tasks',
                                                                   action: 'new',
                                                                   account_id: 'some_user',
                                                                   project_id: 'some_project')
    end

    it 'create' do
      expect(post: '/some_user/some_project/tasks').to route_to(controller: 'tasks',
                                                                action: 'create',
                                                                account_id: 'some_user',
                                                                project_id: 'some_project')
    end
  end
end
