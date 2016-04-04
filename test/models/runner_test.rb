require "test_helper"

class RunnerTest < ActiveSupport::TestCase

  def setup
    @runner = Runner.new(runnername: "John", email: "john@example.com")
  end
  
  test "runner should be valid" do
   assert @runner.valid?
  end
  
  test "runnername should be present" do
    @runner.runnername = " "
    assert_not @runner.valid?
  end
  
  test "runnername should not be too long" do
    @runner.runnername = "a" * 41
    assert_not @runner.valid?
  end
  
  test "runnername should not be too short" do
    @runner.runnername = "aa"
    assert_not @runner.valid?
  end
  
  test "email must be present" do
    @runner.email = " "
    assert_not @runner.valid?
  end
  
  
  test "email length should be within bounds" do
    @runner.email = "a" * 101 + "@example.com"
    assert_not @runner.valid?
  end
  
  test "email address must be unique" do
    dup_runner = @runner.dup
    dup_runner.email = @runner.email.upcase
    @runner.save
    assert_not dup_runner.valid?
  end
  
  test "email address should be valid" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+joe@monk.cm]
    valid_addresses.each do |va|
      @runner.email = va
      assert @runner.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@eee+aar.com]
    invalid_addresses.each do |ia|
      @runner.email = ia
      assert_not @runner.valid?, '#{ia.inspect} should be invalid'
    end
  end
  
end
