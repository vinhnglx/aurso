# Setup Shoulda-matchers with RSpec
# https://github.com/thoughtbot/shoulda-matchers#rspec

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec

    # Choose the following
    with.library :rails
  end
end
