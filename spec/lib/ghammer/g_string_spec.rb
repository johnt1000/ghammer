require "spec_helper"
require "./lib/ghammer/g_string"

describe GString  do
	describe "#quoted" do
		it "empty instance" do
			st = GString.new

			st.quoted('sando ixi ixi')

			expect(st.to_s).to eq('"sando ixi ixi"')
		end

		it "initialized instance" do
			st = GString.new('sando')

			st.quoted('ixi ixi')

			expect(st.to_s).to eq('sando "ixi ixi"')
		end
	end
end