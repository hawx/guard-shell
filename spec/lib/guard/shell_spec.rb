require "guard/compat/test/helper"
require "guard/shell"

RSpec.describe Guard::Shell do
  describe "#start" do
    it "works" do
      subject.start
    end
  end

  describe "#stop" do
    it "works" do
      subject.stop
    end
  end

  describe "#run_all" do
    before do
      allow(Dir).to receive(:glob).and_return(%w(foo bar))
      allow(Guard::Compat).to receive(:matching_files).with(subject, %w(foo bar)).and_return(%w(bar))
    end

    it "delegates to run_on_modifications" do
      expect($stdout).to receive(:puts).with(%w(bar))
      subject.run_all
    end
  end

  describe "#run_on_modifications" do
    it "outputs to the screen" do
      expect($stdout).to receive(:puts).with(%w(bar))
      subject.run_on_modifications(%w(bar))
    end
  end
end

RSpec.describe Guard::Dsl do
  describe '#n' do
    it "uses Guard to notify" do
      expect(Guard::Compat::UI).to receive(:notify).with('foo', title: 'bar', image: 'baz')
      subject.n('foo', 'bar', 'baz')
    end
  end
end
