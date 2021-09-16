# frozen_string_literal: true

# Observable class for the game model
class Observable
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def notify_all
    @observers.each { |observer| observer.update(self) }
  end
end
