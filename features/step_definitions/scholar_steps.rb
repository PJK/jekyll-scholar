
Given(/^I have a "([^"]*)" directory/) do |dir|
  FileUtils.mkdir(dir)
end

Given(/^I have a (?:page|file) "([^"]*)":$/) do |file, string|
  File.open(file, 'w') do |f|
    f.write(string)
  end
end

Given(/^I have a configuration file with "([^\"]*)" set to:$/) do |key, table|
  File.open('_config.yml', 'w') do |f|
    f.write("#{key}:\n")
    table.hashes.each do |row|
      f.write("  #{row["key"]}: #{row["value"]}\n")
    end
  end
end

Given(/^I have a scholar configuration with:$/) do |table|
  File.open('_config.yml', 'w') do |f|
    f.write("scholar:\n")
    table.hashes.each do |row|
      f.write("  #{row["key"]}: #{row["value"]}\n")
    end
  end
end


Then(/^"(.*)" should come before "(.*)" in "(.*)"$/) do |p1, p2, file|
  data = File.open(file).readlines.join('')

  m1 = data.match(p1)
  m2 = data.match(p2)

  assert m1.offset(0)[0] < m2.offset(0)[0]
end

