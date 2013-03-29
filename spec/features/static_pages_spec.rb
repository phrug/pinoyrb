require 'spec_helper'

describe 'Static pages' do
  subject { page }

  describe 'Home page' do
    before { visit root_path }
    it { should have_title(ENV['title']) }
  end

  describe 'Learn page' do
    before { visit learn_path }
    it { should have_title("Learn | #{ENV['title']}") }
  end
end
