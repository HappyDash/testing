require 'fileutils'
require 'rake'

TEST_DIR="tests"

def ansi_colors(color)
  case color
  when :green then ["\033[32m", "\033[0m"]
  when :red   then ["\033[31m", "\033[0m"]
  else ['','']
  end
end

def cp_if_not_already_there(source, destination)
  destination_expanded = File.join(Tuev.cwd, destination)
  source_expanded = File.join(Tuev.gem_path, source)
  print "%-60s" % destination

  if File.exists?(destination_expanded)
    prefix, suffix = ansi_colors(:red)
    puts "#{prefix} ... already exists ... skipping#{suffix}"
  else
    FileUtils.cp(source_expanded, destination_expanded)
    prefix, suffix = ansi_colors(:green)
    puts "#{prefix} ... copied#{suffix}"
  end
end

def mkdir_if_not_already_there(dir)
  dir_expanded = File.join(Tuev.cwd, dir)
  print "%-60s" % "#{dir}"

  if File.exists?(dir_expanded)
    prefix, suffix = ansi_colors(:red)
    puts "#{prefix} ... directory already exists#{suffix}"
  else
    FileUtils.mkdir_p(dir_expanded)
    prefix, suffix = ansi_colors(:green)
    puts "#{prefix} ... directory created#{suffix}"
  end
end

namespace :tuev do
  desc "prepare this project for tuev tests (create sample files, download qunit & friends)"
  task :prepare do
    mkdir_if_not_already_there("config")
    cp_if_not_already_there("contrib/tuev.yml", "config/tuev.yml")

    mkdir_if_not_already_there("#{TEST_DIR}/tuev/test_files")
    cp_if_not_already_there("contrib/tuev_helper.rb", "#{TEST_DIR}/tuev_helper.rb")

    mkdir_if_not_already_there("#{TEST_DIR}/tuev/contrib")
    cp_if_not_already_there("contrib/qunit/qunit/qunit.css",
                            File.join(Tuev.contrib_dir, "qunit.css"))
    cp_if_not_already_there("contrib/qunit/qunit/qunit.js",
                            File.join(Tuev.contrib_dir, "qunit.js"))
    cp_if_not_already_there("contrib/jquery-1.5.1.js",
                            File.join(Tuev.contrib_dir, "jquery-1.5.1.js"))
    cp_if_not_already_there("contrib/mockjax/jquery.mockjax.js",
                            File.join(Tuev.contrib_dir, "jquery.mockjax.js"))
    cp_if_not_already_there("contrib/test_default.html", 
                            File.join(Tuev.contrib_dir, "test_default.html"))
    cp_if_not_already_there("contrib/tuev_qunit.js", 
                            File.join(Tuev.contrib_dir, "tuev_qunit.js"))
  end

  desc "run tests"
  task :run do
    failures = 0
    Tuev.test_suites.each do |test_suite|
      test_suite.create_test_files.each do |file|
        failures += QunitRunner.new(file, Tuev.selenium_conf).run
      end
    end

    puts

    case failures
    when 0
      puts "woohoo: all tests pass -- you rock !!!"
    when 1
      puts "1 test failing -- this is very close to 0 failing actually!"
    when 2..5
      puts "mmm ... #{failures} failing tests! Can't you do better?"
    when 6..15
      puts "ufff ... get to work: #{failures} tests are still failing"
    when 100..1_000_000
      puts "I hope you don't get paid for this code! #{failures} errors!"
    else
      puts "#{failures} failing tests! You gotta be kidding me!"
    end

    puts

    exit(failures)
  end

  desc "create static testfiles for qunit tests"
  task :create_testfiles do
    files = []
    Tuev.test_suites.each do |test_suite|
      files << test_suite.create_test_files
    end

    puts "Created the following test files:\n\t#{files.join("\n\t")}"
  end

end
