require 'spec_helper'

shared_examples 'an eventable GLib object' do
  describe '.events' do
    it 'should return the current Hash of registered events' do
      subject.class.events.should == { 'destroy' => :on_destroy }
    end
  end
  
  describe '#on_destroy' do
    it 'should be run when a `destroy` signal is emitted' do
      subject.at.is_destroyed.should be_false
      subject.signal_emit('destroy')
      subject.at.is_destroyed.should be_true
    end
  end
end

describe BaseWindow do
  it_behaves_like 'an eventable GLib object'
end

describe MainWindow do
  it_behaves_like 'an eventable GLib object'
end

describe ProcWindow do
  describe '#on_destroy' do
    it 'should be run when a `destroy` signal is emitted' do
      subject.at.is_destroyed.should be_false
      subject.signal_emit('destroy')
      subject.at.is_destroyed.should == :true_from_proc
    end
  end
end