require "jekyll/airtable_data/version"
require 'json'
require 'airtable'
require 'active_support/all'

module Jekyll
  module Commands
    class AirtableData < Command
      class << self
        def init_with_program(prog)
          prog.command(:airtable_data) do |c|
            c.action do |args, options|

              @airtable_config = Jekyll.configuration({})['airtable_data']
              @api_key = @airtable_config['api_key']
              @app_id = @airtable_config['app_id']

              @client = Airtable::Client.new("#{@api_key}")

              @airtable_config['tables'].each do |table|

                  @table = @client.table("#{@app_id}", "#{table}")
                  @records = @table.all(:sort => ["Name", :asc])

                  dirname = File.dirname("_data/#{table}")
                  unless File.directory?(dirname)
                    FileUtils.mkdir_p(dirname)
                  end

                  File.open(dirname + "/" + table.parameterize + ".json", "w") do |f|
                    data = @records.map { |record| record.attributes }
                    f.write(data.to_json)
                  end

                  Jekyll.logger.info "Airable:","Generated _data/#{table.parameterize}.json"

              end

              Jekyll.logger.info "Airtable: Sync Complete!"

            end
          end
        end
      end
    end
  end
end