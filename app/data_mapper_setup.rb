env = ENV['RACK_ENV'] || 'development'

Datamapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
