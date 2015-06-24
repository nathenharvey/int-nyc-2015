Ohai.plugin(:Apache) do
  require 'mixlib/shellout'
  provides 'apache'

  collect_data(:default) do
    begin
      modules = shell_out('apachectl -t -D DUMP_MODULES')
      modules.run_command
      apache Mash.new
      apache[:modules] = { :static => [], :shared => [] }
      modules.stdout.each_line do |line|
        fullkey, value = line.split(/\(/,2).map { |i| i.strip }
        apache_mod = fullkey.gsub(/_module/,"")
        dso_type = value.to_s.chomp("\)")
        if dso_type.match(/shared/)
          apache[:modules][:shared] << apache_mod
        elseif dso_type.match(/static/)
          apache[:modules][:static] << apache_mod
        end
      end
    rescue StandardError => error
      httpd[:error] = error.to_s
    end
  end
end
