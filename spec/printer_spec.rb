require 'rspec'
require_relative '../printer'

RSpec.describe Printer do
  describe '.print_options' do
    let(:options) { { 1 => 'Option 1', 2 => 'Option 2', 3 => 'Option 3' } }

    it 'prints the options' do
      expected_output = <<~OUTPUT
        ----------------------------------------------
        Welcome to the Catalog App
        Please choose an option below:
        1. Option 1
        2. Option 2
        3. Option 3
        ----------------------------------------------
      OUTPUT

      expect { described_class.print_options(options) }.to output(expected_output).to_stdout
    end
  end

  describe '.print_list' do
    let(:list) { ['Item 1', 'Item 2', 'Item 3'] }

    it 'prints the list' do
      expected_output = <<~OUTPUT
        Item 1
        Item 2
        Item 3
      OUTPUT

      expect { described_class.print_list(list) }.to output(expected_output).to_stdout
    end
  end

  describe '.print_error' do
    let(:error) { 'Something went wrong!' }

    it 'prints the error' do
      expect { described_class.print_error(error) }.to output("#{error}\n").to_stdout
    end
  end

  describe '.print_success' do
    let(:success) { 'Operation completed successfully!' }

    it 'prints the success message' do
      expect { described_class.print_success(success) }.to output("#{success}\n").to_stdout
    end
  end
end
