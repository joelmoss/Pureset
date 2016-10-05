class Task
  class Bug < Task
    def self.states
      super[:cannot_reproduce] = {
        label: 'Cannot Reproduce',
        closed: true
      }
    end
  end
end
