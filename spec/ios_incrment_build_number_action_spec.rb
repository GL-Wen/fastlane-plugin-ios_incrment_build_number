describe Fastlane::Actions::IosIncrmentBuildNumberAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The ios_incrment_build_number plugin is working!")

      Fastlane::Actions::IosIncrmentBuildNumberAction.run(nil)
    end
  end
end
