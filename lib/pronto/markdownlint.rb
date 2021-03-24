require "pronto"
require "json"
require "shellwords"

module Pronto
  class Markdownlint < Runner
    def run
      return [] if !@patches || @patches.count.zero?

      @patches
        .select { |patch| patch.additions > 0 }
        .select { |patch| style_file?(patch.new_file_full_path) }
        .map { |patch| inspect(patch) }
        .flatten.compact
    end

    private

      def style_file?(file_path)
        /\.md$/ =~ file_path.to_s
      end

      def inspect(patch)
        offences = run_stylelint(patch)

        offences.map do |offence|
          patch
            .added_lines
            .select { |line| line.new_lineno == offence["lineNumber"] }
            .map { |line| new_message(offence, line) }
        end
      end

      def offence_message(offence)
        message = "#{offence["ruleNames"][0]}/#{offence["ruleNames"][1]} #{offence["ruleDescription"]} #{offence["errorDetail"]}"

        message
      end

      def new_message(offence, line)
        path = line.patch.delta.new_file[:path]
        Message.new(path, line, :warning, offence_message(offence), nil, self.class)
      end

      def run_stylelint(patch)
        escaped_file_path = Shellwords.escape(patch.new_file_full_path.to_s)
        `PATH=$(npm bin):$PATH markdownlint-cli2 #{escaped_file_path}`

        JSON.parse(File.read("./markdownlint-results.json"))
      end
  end
end
