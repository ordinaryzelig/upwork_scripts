require 'csv'
require 'pathname'
require 'ap'
require 'fileutils'

input_csv_path =      Pathname.new(ARGV.fetch(0))
input_invoices_path = Pathname.new(ARGV.fetch(1))

output = CSV.generate do |out|
  CSV.foreach(input_csv_path, :headers => true) do |row|
    next unless row.fetch('Description').start_with?('Invoice')

    out << [
      row.fetch('Team'),
      Date.parse(row.fetch('Date')),
      'Upwork',
      0,
      row.fetch('Amount'),
    ]
  end
end

puts output
