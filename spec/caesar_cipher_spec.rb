
require 'spec_helper'

RSpec.describe "caesar_cipher" do
  describe "#caesar-cipher" do
    it "should return `Bmfy f xywnsl` for `What a string` with sift factor of 5" do
      cipher_text = caesar_cipher('What a string', 5)
      expect(cipher_text).to eq('Bmfy f xywnsl')
    end

    it "should return `jvualea hyl aol klmhbsa hsphzlz!!` for `context are the default aliases!!` with sift factor of 10" do
      cipher_text = caesar_cipher('context are the default aliases!!', 7)
      expect(cipher_text).to eq('jvualea hyl aol klmhbsa hsphzlz!!')
    end

    it "should return `eqnl rodb/rodb_gdkodq.qa` for `from spec/spec_helper.rb` with shift factor of 25" do
      cipher_text = caesar_cipher('from spec/spec_helper.rb', 25)
      expect(cipher_text).to eq('eqnl rodb/rodb_gdkodq.qa')
    end
  end
end