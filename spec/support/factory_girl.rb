# Setup Factory_Girl with RSpec
# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md#configure-your-test-suite

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      # Test factories in spec/factories are working.
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
