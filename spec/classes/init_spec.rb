require 'spec_helper'
describe 'cactos_runtime_controller' do
  context 'with default values for all parameters' do
    it { should contain_class('cactos_runtime_controller') }
  end
end
