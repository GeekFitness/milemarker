require 'test_helper'

class ShoeTest < ActiveSupport::TestCase
  
  def setup
    @runner = Runner.create(runnername: "Bob", email: "bob@example.com")
    @shoe = @runner.shoes.build(name: "chicken parm", summary: "Best chicken parm ever!",
               description: "heat pan, cook chicken, eat chicken")
  end
  
  test "shoe should be valid" do
    assert @shoe.valid?
  end
  
  test "runner_id should be present" do
    @shoe.runner_id = nil
    assert_not @shoe.valid?
  end
  
  test "name should be present" do
    @shoe.name = " "
    assert_not @shoe.valid?
  end
  
  test "name length should not be too long" do
    @shoe.name = "a" * 101
    assert_not @shoe.valid?
  end
  
  test "name length should not be too short" do
    @shoe.name = "aaaa"
    assert_not @shoe.valid?
  end
  
  test "summary length should not be too long" do
    @shoe.summary = "a" * 151
    assert_not @shoe.valid?
  end
  
  test "summary length should not be too short" do
    @shoe.summary = "a" * 9
    assert_not @shoe.valid?
  end
  
  test "summary should be present" do
    @shoe.summary = " "
    assert_not @shoe.valid?
  end

  test "description must be present" do
    @shoe.description = " "
    assert_not @shoe.valid?
  end
  
  test "description should not be too long" do
    @shoe.description = "a" * 501
    assert_not @shoe.valid?
  end
  
  test "description should not be too short" do
    @shoe.description = "a" * 19
    assert_not @shoe.valid?
  end
  
  
end