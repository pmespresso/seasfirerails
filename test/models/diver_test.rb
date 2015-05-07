require 'test_helper'

class DiverTest < ActiveSupport::TestCase

	def setup
		@diver = Diver.new(divername: "Mike", email: "mike@exampl.com")
	end

	test "diver should be valid" do
		assert @diver.valid?
	end

	test "diver name should be present" do
		@diver.divername = " "
		assert_not @diver.valid?
	end
 
	test "diver name should not be too long" do
		@diver.divername = "a" * 41
		assert_not @diver.valid?
	end

	test "diver name should not be too short" do
		@diver.divername = "aa" 
		assert_not @diver.valid?
	end

	test "diver email is present" do
		@diver.email = " "
		assert_not @diver.valid?
	end

	test "diver email length should be within bounds" do
		@diver.email = "a" * 101 + "@example.com"
		assert_not @diver.valid?
	end

	test "email address should be unique" do
		dup_diver = @diver.dup
		dup_diver.email = @diver.email.upcase
		@diver.save
		assert_not dup_diver.valid?
	end

	test "email validations should accept valid addresses" do
		valid_addresses = %w[user@eee.com R_TDD-DS@Eee.hello.org user@example.com firs.last@eem.au laura+joe@monk.cm]
		valid_addresses.each do |va|
			@diver.email = va
			assert @diver.valid?, '#{va.inspect} should be valid'
		end
	end

	test "email validations should reject invalid addresses" do
		invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
		invalid_addresses.each do |ia|
			@diver.email = ia
			assert_not @diver.valid?, '#{ia.inspect} should be invalid'
		end
	end

end
