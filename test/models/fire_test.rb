require 'test_helper'

class FireTest < ActiveSupport::TestCase

	def setup
		@diver = Diver.create(divername: "emiko", email: "emiko@email.com")
		@fire = @diver.fires.build(name: "Sick Moray Eel", summary: "pretty sick dive, chill not too bad currents, good visibility", description: "Cool weather, easy dive, nothing went wrong except I was low on oxygen pretty fast.")

	end

	test "fire should be valid" do
		assert @fire.valid?
	end

	test "diver_id should be present" do
		@fire.diver_id = nil
		assert_not @fire.valid?
	end

	test "fire id should be present" do
		@fire.id = nil
		assert_not @fire.valid?
	end

	test "name should be present" do
		@fire.name = " "
		assert_not @fire.valid?
	end

	test "name length should not be too long" do
		@fire.name = "a" * 101
		assert_not @fire.valid?
	end

	test "name length should not be too short" do
		@fire.name = "a" * 4
		assert_not @fire.valid?
	end

	test "summary should be present" do 
		@fire.summary = " "
		assert_not @fire.valid?
	end

	test "summary length should not be too long" do
		@fire.summary = "a" * 151
		assert_not @fire.valid?
	end

	test "summary length should not be too short" do 
		@fire.summary = "a" * 9
		assert_not @fire.valid?
	end

	test "description should be present" do 
		@fire.description = " "
		assert_not @fire.valid?
	end

	test "description length should not be too long" do
		@fire.description = "a" * 501
		assert_not @fire.valid?
	end

	test "description length should not be too short" do 
		@fire.description = "a" * 19
		assert_not @fire.valid?
	end
end