require "test_helper"

class OpeningTest < ActiveSupport::TestCase
  setup do
    @provider = providers(:one)
  end

  test "creating an opening shorter than the minimum appointment time should fail validation" do
    start_time = DateTime.new(2023,11,20,9,0,0)
    end_time = DateTime.new(2023,11,20,9,10,0)

    record = Opening.create(provider_id: @provider.id, start: start_time, end: end_time)

    assert_equal record.errors[:base].length, 1, "there should be a validation error on the base object"
  end

  test "creating an opening longer than the minimum appointment time should pass validation" do
    start_time = DateTime.new(2023,11,20,9,0,0)
    end_time = DateTime.new(2023,11,20,9,15,0)

    record = Opening.create(provider_id: @provider.id, start: start_time, end: end_time)

    assert_equal record.errors[:base].length, 0, "there should not be a validation error on the base object"
  end
end
